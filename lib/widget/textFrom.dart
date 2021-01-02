import 'package:flutter/material.dart';

class TextFormCenter extends StatelessWidget {
  final String labelText;
  final String hintText;
  final double size;
  final double hintSize;
  final Color color;
  final TextInputType type;
  final bool auto;
  final bool obs;
  final Function validate;
  final Function save;

  const TextFormCenter(
      {this.labelText,
      this.auto,
      this.obs,
      this.validate,
      this.save,
      this.hintText,
      this.size,
      this.color,
      this.hintSize,
      this.type});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obs,
      autocorrect: auto,
      validator: validate,
      keyboardType: type,
      onSaved: save,
      decoration: InputDecoration(
          // hintText: hintText,
          // hintStyle: textStyle(
          //   color: color,
          //   size: hintSize,
          // ),
          labelText: labelText,
          labelStyle: textStyle(color: color, size: size)),
    );
  }

  TextStyle textStyle({Color color, double size}) {
    return TextStyle(
        fontStyle: FontStyle.italic,
        color: color,
        // color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'SF Pro Text',
        fontSize: size,
        letterSpacing: 0,
        fontWeight: FontWeight.normal,
        height: 1);
  }
}
