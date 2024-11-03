import 'package:flutter/material.dart';
class RoundIconButton extends StatelessWidget {
  late final IconData iconData;
  late final Function onPressed;

  RoundIconButton(IconData data , Function func){
    this.iconData = data;
    this.onPressed = func;
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconData , color: Colors.white,),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0
      ) ,
      shape: CircleBorder() ,
      fillColor: Color(0xFF4C4F5E),
      onPressed: () {
        onPressed();
      },
    );
  }
}
