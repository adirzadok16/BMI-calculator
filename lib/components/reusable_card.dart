import 'package:flutter/cupertino.dart';

class ReusableCard extends StatelessWidget {
  late final Color colour;
  late final Widget cardChild;

  ReusableCard(Color color , Widget child){
    this.colour = color;
    this.cardChild = child;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color:colour,
          borderRadius: BorderRadius.circular(10.0)
      ),
      height: 200.0,
      width: 170.0,
    );
  }
}
