import 'package:flutter/material.dart';

class SearchCenter extends StatelessWidget {
  final String title;
  final Function press;
  final TextEditingController controller;
  final IconData icon;

  const SearchCenter({
    Key key,
    this.title,
    this.icon,
    this.controller,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      width: 314,
      alignment: Alignment.center,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color(0xffEFEEEE),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: title,
            suffixIcon: IconButton(
              icon: Icon(
                icon,
                color: Colors.black.withOpacity(0.7),
              ),
              onPressed: () {},
            ),
            hintStyle: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'SF Pro Rounded',
                fontSize: 17,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1)),
      ),
    );
  }
}
