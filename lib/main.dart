import 'package:flutter/material.dart';
import 'package:math_quiz_game/menu_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Math Quiz Game',
      home: MenuPage(),
    );
  }
}
