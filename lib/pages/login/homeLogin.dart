import 'package:flutter/material.dart';
import 'package:food/pages/login/login.dart';
import 'package:food/widget/buttonCenter.dart';

class HomeLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/img/loginback.png"))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              LoginLogo(),
              SizedBox(
                height: 50,
              ),
              ButtonCenter(
                color: Colors.white,
                textcolor: Color(0xffFF460A),
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                size: 17,
                text: "Get Started",
                weight: FontWeight.w600,
              )
            ],
          ),
        ),
      ),
    );
  }
}

TextStyle textStyle({FontWeight weight}) {
  return TextStyle(
      color: Color.fromRGBO(250, 74, 12, 1).withOpacity(.6),
      fontFamily: 'SF Pro Text',
      fontSize: 17,
      letterSpacing: 0,
      fontWeight: weight,
      height: 1);
}

class LoginLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 262,
      height: 262,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.all(Radius.elliptical(262, 262)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/img/loginlogo.jpg"),
          Text('Food for Everyone',
              textAlign: TextAlign.left,
              style: textStyle(weight: FontWeight.bold))
        ],
      ),
    );
  }

  TextStyle textStyle({FontWeight weight}) {
    return TextStyle(
        color: Color.fromRGBO(250, 74, 12, 1).withOpacity(.6),
        fontFamily: 'SF Pro Text',
        fontSize: 17,
        letterSpacing: 0,
        fontWeight: weight,
        height: 1);
  }
}
