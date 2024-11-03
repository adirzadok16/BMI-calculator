import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';
import '../components/reusable_card.dart';

class Resultpage extends StatelessWidget {
  late final String BMI_calculation;
  late final String BMI_result;
  late final String BMI_Interpretation;

  Resultpage(String calculation, String result, String interpretation) {
    this.BMI_calculation = calculation;
    this.BMI_result = result;
    this.BMI_Interpretation = interpretation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'YOUR RESULT',
                  style: kTitleTextStyle,
                )),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              kActiveCardColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    BMI_result.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    BMI_calculation,
                    style: kBMITextStyle,
                  ),
                  Text(
                    BMI_Interpretation,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Center(
                  child: Text(
                    'RE-CALCULATE',
                    style: kLabelBottomContainerTextStyle,
                  ),
                ),
                color: kBottomContainerBackground,
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: 15.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
