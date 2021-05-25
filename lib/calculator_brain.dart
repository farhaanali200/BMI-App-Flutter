import 'dart:math';

import 'package:flutter/cupertino.dart';
class CalculatorBrain {

  CalculatorBrain({@required this.height, @required this.weight});

  final double weight;
  final double height;
  double _bmi;

  String calculator() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getHealth() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Your body weight is higher than normal';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight';
    } else {
      return 'Your body weight is lower than normal';
    }
  }
}