import 'package:flutter/material.dart';
import 'package:math_quiz_game/configs/globals.dart';
import 'package:math_quiz_game/menu_page.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Math Quiz Game',
      home: MenuPage(),
      theme: ThemeData(
        primaryColor: Colors.pink,
        accentColor: Colors.pink,
      ),
    );
  }
}
