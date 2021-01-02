import 'package:flutter/material.dart';
import 'package:food/pages/login/singUp.dart';
import 'package:food/widget/buttonCenter.dart';
import 'package:food/widget/textCenter.dart';
import 'package:food/widget/textFrom.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color(0xffF2F2F2),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 100),
                  TextCenterMe(
                    align: Alignment.center,
                    press: () {},
                    size: 26,
                    text: "Welcome Back!",
                    weight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  SizedBox(height: 16),
                  TextCenterMe(
                      align: Alignment.center,
                      press: () {},
                      text: "Please enter your account here",
                      size: 17,
                      weight: FontWeight.normal,
                      color: Color(0xff9FA5C0)),
                  SizedBox(height: 16),
                  TextFormCenter(
                    auto: false,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    hintText: "Email adress",
                    labelText: "Email Adress",
                    obs: false,
                    type: TextInputType.emailAddress,
                    save: (value) {},
                    validate: (value) {},
                    size: 15,
                    hintSize: 17,
                  ),
                  SizedBox(height: 30),
                  TextFormCenter(
                    auto: true,
                    color: Color.fromRGBO(0, 0, 0, 1),
                    hintText: "Password",
                    labelText: "Password",
                    type: TextInputType.visiblePassword,
                    obs: true,
                    save: (value) {},
                    validate: (value) {},
                    size: 15,
                    hintSize: 17,
                  ),
                  SizedBox(height: 30),
                  TextCenterMe(
                    color: Color.fromRGBO(250, 74, 12, 1),
                    press: () {},
                    size: 17,
                    text: "Forget Password?",
                    weight: FontWeight.w500,
                    align: Alignment.centerRight,
                  ),
                  SizedBox(height: 50),
                  ButtonCenter(
                    color: Color(0xffFA4A0C),
                    textcolor: Colors.white,
                    press: () {},
                    text: "Login",
                    size: 17,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(height: 20),
                  TextCenterMe(
                      align: Alignment.center,
                      press: () {},
                      text: "Or continue with",
                      size: 17,
                      weight: FontWeight.normal,
                      color: Color(0xff9FA5C0)),
                  SizedBox(height: 20),
                  ButtonCenter(
                    color: Color(0xff0038FFC),
                    textcolor: Colors.white,
                    press: () {},
                    text: "Google",
                    size: 17,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextCenterMe(
                        align: Alignment.center,
                        press: () {},
                        text: "Don’t have any account?",
                        size: 17,
                        weight: FontWeight.normal,
                        color: Color(0xff9FA5C0),
                      ),
                      SizedBox(width: 10),
                      TextCenterMe(
                        align: Alignment.center,
                        press: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SingUp()));
                        },
                        text: "Sing Up",
                        size: 17,
                        weight: FontWeight.normal,
                        color: Color(0xffFA4A0C),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
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
