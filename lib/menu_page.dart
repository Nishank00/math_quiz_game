import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_quiz_game/options_page.dart';
import 'package:math_quiz_game/play_game.dart';
import 'package:math_quiz_game/selectOperator.dart';

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
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background3.jpg"),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.35),
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: Text(
                  "MATH QUIZ",
                  style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3.0,
                      color: Colors.white),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //PLAY BuTTON
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectOperator()));
                      },
                      child: Container(
                        height: h * 0.1,
                        width: w * 0.7,
                        decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        margin: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.play_arrow_outlined,
                              color: Colors.white,
                              size: 40,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "PLAY",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
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
                        decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        margin: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Container(
                            //   height: 35,
                            //   width: 35,
                            //   decoration: BoxDecoration(
                            //       image: DecorationImage(
                            //           image: AssetImage("assets/options.png"))),
                            // ),
                            Icon(
                              Icons.settings,
                              color: Colors.white,
                              size: 35,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "OPTIONS",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
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
                        decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        margin: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.exit_to_app,
                              color: Colors.white,
                              size: 35,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "EXIT",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
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
      ),
    );
  }
}
