import 'dart:async';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class PlayGame extends StatefulWidget {
  const PlayGame({Key? key}) : super(key: key);

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
  String operator = "+";
  late List<int> numbers;
  late int correctAnswer;

  //Start timer function
  void startTimer() async {
    const oneSecond = const Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      if (timerStart == 0) {
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

  //Dialog Box
  showAlertDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      child: Text("Try Again"),
      onPressed: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => PlayGame()),
            (route) => false);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Skip"),
      onPressed: () {
        generateRandomNumbers();
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

  /* 
  - Generate Random Numbers
  - Append them in the List 
  - Shuffle the list
  - Store the correct answer in an variable.
  */
  generateRandomNumbers() {
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
    numbers.add(operand1 + operand2);
    numbers.add(operand1 + operand2 + 5);
    numbers.add(operand1 + operand2 - 5);
    numbers.shuffle();
    setState(() {
      correctAnswer = operand1 + operand2;
    });
    if (questionNo > 10) {
      Fluttertoast.showToast(msg: "All questions done");
    }
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    generateRandomNumbers();
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
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Center(
                child: Text(
              "Question No : $questionNo",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            )),
            SizedBox(
              height: h * 0.03,
            ),
            Text(
              "$operand1 $operator $operand2 = ?",
              style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
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
                          print("Congratulations, You earned 5 points");
                          generateRandomNumbers();
                          score += 5;
                        } else {
                          showAlertDialog(context);
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        height: h * 0.1,
                        color: Colors.red,
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
