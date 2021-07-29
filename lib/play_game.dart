import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class PlayGame extends StatefulWidget {
  const PlayGame({Key? key}) : super(key: key);

  @override
  _PlayGameState createState() => _PlayGameState();
}

class _PlayGameState extends State<PlayGame> {
  late Timer _timer;
  int timerStart = 60;
  int score = 0;
  int questionNo = 1;
  late int operand1, operand2;
  String operator = "+";
  List<int> numbers = [];
  late int correctAnswer;

  void startTimer() async {
    const oneSecond = const Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      if (timerStart == 0) {
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

  generateRandomNumbers() {
    var rng = Random();
    for (var i = 0; i < 10; i++) {
      operand1 = rng.nextInt(9);
      operand2 = rng.nextInt(9);
    }
    print("Operand 1: $operand1, Operand2: $operand2");

    numbers.add(operand1 + operand2);
    numbers.add(operand1 + operand2 + 5);
    numbers.add(operand1 + operand2 - 5);
    numbers.shuffle();
    setState(() {
      correctAnswer = operand1 + operand2;
    });
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
      // body: Container(
      //   decoration: BoxDecoration(
      //       image: DecorationImage(
      //           image: AssetImage("assets/game_background.jpg"),
      //           fit: BoxFit.cover)),
      // ),
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
                        } else {
                          print("Tatti putti");
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
