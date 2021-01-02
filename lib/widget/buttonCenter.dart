import 'package:flutter/material.dart';

class ButtonCenter extends StatelessWidget {
  final Function press;
  final Color textcolor;
  final Color color;
  final FontWeight weight;
  final double size;
  final String text;
  const ButtonCenter({
    this.press,
    this.text,
    this.textcolor,
    this.weight,
    this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: press,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 65,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
            // color: Color.fromRGBO(255, 255, 255, 1),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: newMethod(
              color: textcolor,
              size: size,
              weight: weight,
            ),
          ),
        ),
      ),
    );
  }

  TextStyle newMethod({Color color, FontWeight weight, double size}) {
    return TextStyle(
        color: color,
        fontFamily: 'SF Pro Text',
        fontSize: size,
        letterSpacing: 0,
        fontWeight: weight,
        height: 1);
  }
}
