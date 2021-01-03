import 'package:flutter/material.dart';
import 'package:food/modals/users.dart';
import 'package:food/pages/login/login.dart';
import 'package:food/services/auth/authacation.dart';
import 'package:food/services/auth/streamAuth.dart';
import 'package:food/services/cloud/cloud.dart';
import 'package:food/widget/buttonCenter.dart';
import 'package:food/widget/textCenter.dart';
import 'package:food/widget/textFrom.dart';

class SingUp extends StatefulWidget {
  @override
  _SingUpState createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  String name, email, password;
  Authacation authacation = Authacation();
  final _key = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
                            text: "Welcome",
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
                          SizedBox(height: 25),
                          Column(
                            children: [
                              TextFormCenter(
                                auto: false,
                                color: Color.fromRGBO(0, 0, 0, 1),
                                hintText: "",
                                labelText: "Name",
                                obs: false,
                                save: (value) {
                                  name = value;
                                },
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return "You are use add name label";
                                  } else if (value.trim().length < 6) {
                                    return "You are wrong name";
                                  }
                                  return null;
                                },
                                type: TextInputType.name,
                                size: 15,
                                hintSize: 17,
                              ),
                              SizedBox(height: 30),
                              TextFormCenter(
                                type: TextInputType.emailAddress,
                                auto: false,
                                color: Color.fromRGBO(0, 0, 0, 1),
                                hintText: "Email adress",
                                labelText: "Email Adress",
                                obs: false,
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
                              SizedBox(height: 30),
                              TextFormCenter(
                                auto: true,
                                type: TextInputType.visiblePassword,
                                color: Color.fromRGBO(0, 0, 0, 1),
                                hintText: "",
                                labelText: "Password",
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
                            ],
                          ),
                          SizedBox(height: 50),
                          ButtonCenter(
                            color: Color(0xffFA4A0C),
                            textcolor: Colors.white,
                            press: singUp,
                            text: "Sing Up",
                            size: 17,
                            weight: FontWeight.w600,
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextCenter(
                                align: Alignment.center,
                                press: () {},
                                text: "Have you account?",
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
                                          builder: (context) => Login()));
                                },
                                text: "Login",
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

  Future<Users> singUp() async {
    print("button çalışıyor");

    print("button çalışıyor MU");
    if (_key.currentState.validate()) {
      _key.currentState.save();
      setState(() {
        isLoading = true;
      });
      try {
        Users users = await authacation.singUp(email, password);
        print("button çalışıyor try");
        if (users != null) {
          CloudStore().cloudUserCreate(email: email, id: users.id, name: name);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => StreamAuthProvider()));
        }
      } catch (e) {
        setState(() {
          isLoading = false;
        });
      }
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
