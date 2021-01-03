import 'package:flutter/material.dart';
import 'package:food/modals/users.dart';
import 'package:food/pages/login/singUp.dart';
import 'package:food/services/auth/authacation.dart';
import 'package:food/services/auth/streamAuth.dart';
import 'package:food/services/cloud/cloud.dart';
import 'package:food/widget/buttonCenter.dart';
import 'package:food/widget/textCenter.dart';
import 'package:food/widget/textFrom.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email, password;
  Authacation authacation = Authacation();
  bool isLoading = false;
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: Form(
        key: _key,
        child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(0xffF2F2F2),
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 20),
                          Image.asset(
                            "assets/img/loginlogo.jpg",
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 10),
                          TextCenter(
                            align: Alignment.center,
                            press: () {},
                            size: 26,
                            text: "Welcome Back!",
                            weight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          SizedBox(height: 16),
                          TextCenter(
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
                            save: (value) {
                              email = value;
                            },
                            validate: (value) {
                              if (value.isEmpty) {
                                return "You are use add email label";
                              } else if (!value.contains("@")) {
                                return "You are email not true";
                              }
                              return null;
                            },
                            size: 15,
                            hintSize: 17,
                          ),
                          SizedBox(height: 20),
                          TextFormCenter(
                            auto: true,
                            color: Color.fromRGBO(0, 0, 0, 1),
                            hintText: "",
                            labelText: "Password",
                            type: TextInputType.visiblePassword,
                            obs: true,
                            save: (value) {
                              password = value;
                            },
                            validate: (value) {
                              if (value.isEmpty) {
                                return "You are use add password label";
                              } else if (value.trim().length < 6) {
                                return "You are Wrong password";
                              }
                              return null;
                            },
                            size: 15,
                            hintSize: 17,
                          ),
                          SizedBox(height: 30),
                          TextCenter(
                            color: Color.fromRGBO(250, 74, 12, 1),
                            press: () {},
                            size: 17,
                            text: "Forget Password?",
                            weight: FontWeight.w500,
                            align: Alignment.centerRight,
                          ),
                          SizedBox(height: 20),
                          ButtonCenter(
                            color: Color(0xffFA4A0C),
                            textcolor: Colors.white,
                            press: login,
                            text: "Login",
                            size: 17,
                            weight: FontWeight.w600,
                          ),
                          SizedBox(height: 20),
                          TextCenter(
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
                            press: google,
                            text: "Google",
                            size: 17,
                            weight: FontWeight.w600,
                          ),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextCenter(
                                align: Alignment.center,
                                press: () {},
                                text: "Don’t have any account?",
                                size: 17,
                                weight: FontWeight.normal,
                                color: Color(0xff9FA5C0),
                              ),
                              SizedBox(width: 10),
                              TextCenter(
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
      ),
    );
  }

  Future<Users> login() async {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      // print("tamam çalışıyor");
      setState(() {
        print("tamam çalışıyorzxz");
        isLoading = true;
      });
      try {
        Users user = await authacation.singIn(email, password);
        if (user != null) {
          Users users = await CloudStore().cloudUserGet(id: user.id);
          if (users == null) {
            print("kullanici bulunamadı");
          }
        }

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => StreamAuthProvider()));
      } catch (e) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  Future<Users> google() async {
    setState(() {
      isLoading = true;
    });

    print("google calışıoyr");
    try {
      Users users = await authacation.google();
      if (users != null) {
        Users user = await CloudStore().cloudUserGet(id: users.id);
        if (user == null) {
          print("cloudcreate çalışıyor");
          CloudStore().cloudUserCreate(
              id: users.id,
              email: users.email,
              name: users.name,
              photoUrl: users.photoUrl);
        }
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => StreamAuthProvider()));
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
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
