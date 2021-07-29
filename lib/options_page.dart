import 'package:flutter/material.dart';
import 'package:math_quiz_game/configs/globals.dart';

class OptionsPage extends StatefulWidget {
  const OptionsPage({Key? key}) : super(key: key);

  @override
  _OptionsPageState createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Options"),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "MUSIC : ",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      isMusicOn = !isMusicOn;
                    });
                  },
                  child: isMusicOn ? Text("ON") : Text("OFF"))
            ],
          ),
        ),
      ),
    );
  }
}
