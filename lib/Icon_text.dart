import 'package:flutter/material.dart';
import 'constants.dart';

class IconText extends StatelessWidget {

  IconText({@required this.gender, this.supericon});
  final String gender;
  final IconData supericon;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          supericon,
          size: 110,
          color: Colors.white,
        ),
        SizedBox(height: 15),
        Text(gender, style: kStyleText)
      ],
    );
  }
}