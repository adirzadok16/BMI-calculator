import 'package:bmi_calculator/Screens/ResultPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import '../constant.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: ReusableCard(
                    selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    IconContent(FontAwesomeIcons.mars, "MALE"),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: ReusableCard(
                    selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    IconContent(FontAwesomeIcons.venus, "FEMALE"),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ReusableCard(
              kActiveCardColor,
              Column(
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberLabelTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: kBottomContainerBackground,
                      overlayColor: Color(0x26EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newDouble) {
                          setState(() {
                            height = newDouble.round();
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  kInactiveCardColor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(weight.toString(), style: kNumberLabelTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(FontAwesomeIcons.minus, () {
                            setState(() {
                              weight--;
                            });
                          }),
                          SizedBox(
                            width: 15.0,
                          ),
                          RoundIconButton(FontAwesomeIcons.plus, () {
                            setState(() {
                              weight++;
                            });
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                    kInactiveCardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(FontAwesomeIcons.minus, () {
                              setState(() {
                                age--;
                              });
                            }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(FontAwesomeIcons.plus, () {
                              setState(() {
                                age++;
                              });
                            }),
                          ],
                        )
                      ],
                    )),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain cb = CalculatorBrain(height, weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Resultpage(
                    cb.calculateBMI(),
                    cb.getResult(),
                    cb.getInterpretation(),
                  ),
                ),
              );
            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE YOUR BMI',
                  style: kLabelBottomContainerTextStyle,
                ),
              ),
              color: kBottomContainerBackground,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kHeightBottomButton,
            ),
          ),
        ],
      ),
    );
  }
}
