import 'package:flutter/material.dart';
import 'package:math_quiz_game/play_game.dart';

class SelectOperator extends StatefulWidget {
  const SelectOperator({Key? key}) : super(key: key);

  @override
  _SelectOperatorState createState() => _SelectOperatorState();
}

class _SelectOperatorState extends State<SelectOperator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Game mode",
          style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              fontWeight: FontWeight.normal),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlayGame(operator: "+")));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Center(
                          child: const Text(
                        "+",
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlayGame(operator: "-")));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Center(
                          child: const Text('-',
                              style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))),
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlayGame(operator: "x")));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Center(
                          child: Text('x',
                              style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))),
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlayGame(operator: "÷")));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Center(
                          child: const Text('÷',
                              style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))),
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
