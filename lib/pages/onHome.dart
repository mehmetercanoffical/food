import 'package:flutter/material.dart';
import 'package:food/widget/textCenter.dart';

class OnHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffFF4B3A),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25.0,
              vertical: 50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/img/waitlogo.png", fit: BoxFit.cover),
                SizedBox(height: 20),
                TextCenter(
                  align: Alignment.centerLeft,
                  color: Colors.white,
                  press: () {},
                  size: 65,
                  text: "Food for\nEveryone",
                  weight: FontWeight.bold,
                ),
              ],
            ),
          ),
          Container(
            color: Colors.transparent,
            width: double.infinity,
            height: 300,
            child: Image.asset("assets/img/people.png",
                filterQuality: FilterQuality.medium, fit: BoxFit.cover),
          ),
        ],
      ),
    ));
  }
}
