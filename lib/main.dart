import 'package:flutter/material.dart';
import 'input_class.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0XFF0F193F),
        scaffoldBackgroundColor: Color(0XFF0F193F)
        // Color(0XFF0A0E21),
      ),
      debugShowCheckedModeBanner: false,
      home: InputPage(),
    );
  }
}

