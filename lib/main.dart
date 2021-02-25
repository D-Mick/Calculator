import 'package:calculator/SimpleCalculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primaryColor: Color(0xFF0A0e21),
        scaffoldBackgroundColor: Color(0xFF0A0e21),
        accentColor: Colors.purple,
        textTheme: TextTheme(
          body1: TextStyle(color: Color(0xFFFFFFF)),
        ),
      ),
      home: simpleCalculator(),
    );
  }
}
