import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_quiz_game/options_page.dart';
import 'package:math_quiz_game/play_game.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "MATH QUIZ",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //PLAY BuTTON
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PlayGame()));
                    },
                    child: Container(
                      height: h * 0.1,
                      width: w * 0.7,
                      color: Colors.red,
                      margin: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/play.png"))),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "PLAY",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  //OPTIONS BUTTON
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OptionsPage()));
                    },
                    child: Container(
                      height: h * 0.1,
                      width: w * 0.7,
                      color: Colors.red,
                      margin: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/options.png"))),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "OPTIONS",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  // Exit Button
                  InkWell(
                    onTap: () {
                      SystemNavigator.pop();
                    },
                    child: Container(
                      height: h * 0.1,
                      width: w * 0.7,
                      color: Colors.red,
                      margin: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/exit.png"))),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "EXIT",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
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
