import 'package:flutter/material.dart';

class TextCenterMe extends StatelessWidget {
  final Function press;
  final String text;
  final Color color;
  final FontWeight weight;
  final double size;
  final Alignment align;

  const TextCenterMe(
      {Key key,
      this.press,
      this.text,
      this.color,
      this.weight,
      this.size,
      this.align})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        alignment: align,
        child: Text(text,
            textAlign: TextAlign.left,
            style: textStyle(color: color, size: size, weight: weight)),
      ),
    );
  }

  TextStyle textStyle({Color color, double size, FontWeight weight}) {
    return TextStyle(
        color: color,
        fontFamily: 'SF Pro Text',
        fontSize: size,
        letterSpacing: 0,
        fontWeight: weight,
        height: 1);
  }
}
