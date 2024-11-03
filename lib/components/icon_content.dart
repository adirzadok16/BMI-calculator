import 'package:flutter/material.dart';
import '../constant.dart';


class IconContent extends StatelessWidget {
  late final IconData icon;
  late final String label;

  IconContent(IconData icon , String label){
    this.icon = icon;
    this.label = label;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:<Widget>[
        Icon(icon ,size: 80.0,color: Colors.white,),
        SizedBox(height: 15.0),
        Text(label , style: kLabelTextStyle),
      ]
      ,);
  }
}