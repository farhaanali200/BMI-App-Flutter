import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'input_class.dart';
import 'package:bmi_calculator/BottomWidget.dart';

class ResultPage extends StatelessWidget {

  ResultPage({this.bmiResult,this.health,this.interpretation});

  final String bmiResult;
  final String health;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // Expanded(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       Text('Made with Love by Farhaan',
          //         style: TextStyle(fontFamily: 'dancingscript',
          //             fontSize: 30,
          //           color: Colors.white
          //         ),
          //       ),
          //       SizedBox(width: 10),
          //       Icon(
          //         FontAwesomeIcons.solidHeart,
          //         color: Colors.red,
          //         size: 30,
          //       )
          //     ],
          //   ),
          // ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text('Your Result', style: kTitleTextStyle),
            ),
          ),
          Expanded(
            flex: 8,
            child: ResuableCard(
              color: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(health, style: kResultTextStyle),
                  Text(bmiResult, style: kBmiTextStyle),
                  Text(interpretation, style: kBottomResultTextStyle, textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
          Expanded(
            child: BottomWidget(
              text: 'RE CALCULATE',
              onPress: (){
                Navigator.pop(context);
              },
            )
          )
        ],
      ),
    );
  }
}
