import 'dart:async';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:math_quiz_game/menu_page.dart';
import 'package:share_plus/share_plus.dart';

class PlayGame extends StatefulWidget {
  final String operator;
  const PlayGame({Key? key, required this.operator}) : super(key: key);

  @override
  _PlayGameState createState() => _PlayGameState();
}

class _PlayGameState extends State<PlayGame> {
  // Variables and initalisation of timer
  late Timer _timer;
  int timerStart = 60;
  int score = 0;
  int questionNo = 0;
  late int operand1, operand2;
  late String operator;
  late List<int> numbers;
  late int correctAnswer;

  //Start timer function
  void startTimer() async {
    const oneSecond = const Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      if (timerStart == 0) {
        gameOverDialog(context);
        Fluttertoast.showToast(msg: "Time is up", backgroundColor: Colors.red);
        setState(() {
          _timer.cancel();
        });
      } else {
        setState(() {
          timerStart--;
        });
      }
    });
  }

  //Wrong Answer Dialog
  wrongAnwserDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      child: Text(
        "Try Again",
        style: TextStyle(fontSize: 15, color: Colors.pink),
      ),
      onPressed: () {
        Navigator.pop(context);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => PlayGame(
                      operator: operator,
                    )),
            (route) => false);
      },
    );
    Widget continueButton = TextButton(
      child: Text(
        "Skip",
        style: TextStyle(fontSize: 15, color: Colors.pink),
      ),
      onPressed: () {
        Fluttertoast.showToast(msg: "Question Skipped");
        generateRandomNumbers(context);
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Wrong Answer"),
      content: Text("Oops! Your answer is wrong"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  //Game Over Dialog
  gameOverDialog(context) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height - 400,
            child: AlertDialog(
              insetPadding: EdgeInsets.symmetric(vertical: 70.0),
              title: Text(
                "Gameover",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              content: Column(
                children: [
                  score > 25
                      ? Text(
                          "Congratulations! You have scored",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        )
                      : Text(
                          "You can do better, You have scored",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: score > 25
                                ? AssetImage("assets/congratulations.gif")
                                : AssetImage("assets/sad.gif"),
                            fit: BoxFit.scaleDown)),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: Text(
                      "$score / 50",
                      style: TextStyle(
                          fontSize: 32.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  InkWell(
                    onTap: () {
                      Share.share(
                          "Hey Friends, I scored $score / 50. In this Math Quiz Game");
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.share,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text("Share with Friends")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  child: Text(
                    "Play Again!",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlayGame(
                                  operator: operator,
                                )),
                        (route) => false);
                  },
                ),
                TextButton(
                  child: Text(
                    "Exit",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => MenuPage()),
                        (route) => false);
                  },
                ),
              ],
            ),
          );
        });
  }

  /* 
  - Generate Random Numbers
  - Append them in the List 
  - Shuffle the list
  - Store the correct answer in an variable.
  */
  generateRandomNumbers(context) {
    questionNo += 1;
    var rng = Random();
    for (var i = 0; i < 10; i++) {
      setState(() {
        operand1 = rng.nextInt(9);
        operand2 = rng.nextInt(9);
      });
    }
    print("Operand 1: $operand1, Operand2: $operand2");
    numbers = [];
    switch (operator) {
      case "+":
        numbers.add(operand1 + operand2);
        numbers.add(operand1 + operand2 + 5);
        numbers.add(operand1 + operand2 - 5);
        setState(() {
          correctAnswer = operand1 + operand2;
        });
        break;
      case "-":
        numbers.add(operand1 - operand2);
        numbers.add(operand1 - operand2 + 5);
        numbers.add(operand1 - operand2 - 5);
        setState(() {
          correctAnswer = operand1 - operand2;
        });
        break;
      case "x":
        numbers.add(operand1 * operand2);
        numbers.add(operand1 * operand2 + 5);
        numbers.add(operand1 * operand2 - 5);
        setState(() {
          correctAnswer = operand1 * operand2;
        });
        break;
      case "÷":
        numbers.add((operand1 ~/ operand2).toInt());
        numbers.add((operand1 / operand2 + 5).toInt());
        numbers.add((operand1 / operand2 - 5).toInt());
        setState(() {
          correctAnswer = (operand1 ~/ operand2).toInt();
        });
        break;
      default:
    }
    numbers.shuffle();

    if (questionNo > 10) {
      gameOverDialog(context);
    }
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    setState(() {
      operator = widget.operator;
    });
    generateRandomNumbers(context);

    print(operator);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: h * 0.09,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Score: $score",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage('assets/alarm.gif'))),
            ),
            Text(
              "Timer: $timerStart",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background3.jpg"), fit: BoxFit.cover),
        ),
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.all(Radius.circular(40.0))),
              child: Column(
                children: [
                  Center(
                      child: Text(
                    "Question No : $questionNo",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  Text(
                    "$operand1 $operator $operand2 = ?",
                    style: TextStyle(
                        fontSize: 38.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h * 0.03,
            ),
            Container(
              height: h * 0.5,
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (numbers[index] == correctAnswer) {
                          Fluttertoast.showToast(
                              msg: "Congratulations, You earned 5 points",
                              backgroundColor: Colors.green,
                              textColor: Colors.white);
                          generateRandomNumbers(context);
                          score += 5;
                        } else {
                          wrongAnwserDialog(context);
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        height: h * 0.1,
                        decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        width: w * 0.6,
                        child: Center(
                          child: Text(
                            numbers[index].toString(),
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
