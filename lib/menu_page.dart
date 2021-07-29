import 'package:flutter/material.dart';

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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: h * 0.1,
                width: w * 0.7,
                color: Colors.red,
                margin: EdgeInsets.all(10.0),
              ),
              Container(
                height: h * 0.1,
                width: w * 0.7,
                color: Colors.red,
                margin: EdgeInsets.all(10.0),
              ),
              Container(
                height: h * 0.1,
                width: w * 0.7,
                color: Colors.red,
                margin: EdgeInsets.all(10.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
