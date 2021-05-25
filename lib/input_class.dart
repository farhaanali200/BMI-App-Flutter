import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'Icon_text.dart';
import 'constants.dart';
import 'results_page.dart';
import 'package:bmi_calculator/BottomWidget.dart';
import 'package:bmi_calculator/Round_icon_widget.dart';
import 'calculator_brain.dart';

enum Gender {
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  double height = 170;
  double weight = 60;
  double age = 20;

  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF0F193F),
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
        backgroundColor: Color(0xFF0A0D22),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //first expanded
            Expanded(
              flex: 3,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: ResuableCard(
                          onPress: (){
                            setState(() {
                              selectedGender=Gender.male;
                            });
                          },
                            color: selectedGender==Gender.male? kInActiveColor : kActiveColor,
                        cardChild: IconText(gender: 'Male', supericon: FontAwesomeIcons.mars,)
                        )
                    ),
                    Expanded(
                        child: ResuableCard(
                          onPress: (){
                            setState(() {
                              selectedGender=Gender.female;
                            });
                          },
                            color: selectedGender==Gender.female? kInActiveColor : kActiveColor,
                        cardChild: IconText(gender: 'Female', supericon: FontAwesomeIcons.venus,)
                        )
                    )
                    ])
            ),



            //Second expanded
            Expanded(
              flex: 3,
              child: ResuableCard(
                color: kActiveColor,
                cardChild: Column(
                  children: <Widget>[
                    kSizedBox,
                    Text('HEIGHT',style: kStyleText),
                    kSizedBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.round().toString(), style: kNumberTextStyle),
                        Text('cm',style: kStyleText),
                      ],
                    ),
                    kSizedBox,
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16),
                        inactiveTrackColor: Color(0XFF8D8E98),
                        thumbColor: Color(0XFFF71490),
                        activeTrackColor: Colors.white,
                        overlayColor: Color(0X16F71490),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      ) ,
                      child: Slider(
                          value: height,
                          // activeColor: kBottomContainerColor,
                          min: 120,
                          max: 220,
                          label: height.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              height=value;
                            });
                          }
                      ),
                    )
                  ],
                ),
              )
            ),



            //Third expanded
            Expanded(
              flex: 3,
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ResuableCard(
                        color: kActiveColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Weight',
                            style: kStyleText,
                          ),
                          Text(weight.round().toString(), style: kNumberTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPress: (){
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                )
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPress: (){
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                )
                              )
                            ],
                          )
                        ],
                      ),
                      )
                  ),
                  Expanded(
                    child: ResuableCard(
                        color: kActiveColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Age', style: kStyleText),
                            Text(age.round().toString(), style: kNumberTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>  [
                              Expanded(
                                child: RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPress: (){
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPress: (){
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  )
                ],
              ),
            ),


            //Fourth expanded
            Expanded(
              child: BottomWidget(
                text: 'CALCULATE',
                onPress: (){
                  CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

                  Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
                    bmiResult: calc.calculator(),
                    health: calc.getHealth(),
                    interpretation: calc.getInterpretation(),
                  )));
              })
            )
          ],
        ),
    );
  }
}