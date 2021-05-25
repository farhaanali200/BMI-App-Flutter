import 'package:flutter/material.dart';
import 'constants.dart';

class BottomWidget extends StatelessWidget {

  BottomWidget({@required this.text, this.onPress});
  final String text;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Center(child: Text(text, style: kLargeButtonTextStyle)),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        height: 10,
      ),
    );
  }
}