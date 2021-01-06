import 'package:flutter/material.dart';
import 'package:food/modals/users.dart';
import 'package:food/services/auth/authacation.dart';
import 'package:food/services/auth/streamAuth.dart';
import 'package:food/services/cloud/cloud.dart';
import 'package:food/widget/buttonCenter.dart';
import 'package:food/widget/textCenter.dart';

class Person extends StatefulWidget {
  final String userId;

  const Person({Key key, this.userId}) : super(key: key);
  @override
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<Person> {
  @override
  // void initState() {
  //   print(widget.userId);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: CloudStore().cloudUserGet(id: widget.userId),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Color(0xffF1F1F1),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 50),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(Icons.chevron_left),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.settings),
                              onPressed: () {
                                // Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Column(children: [
                            TextCenter(
                              text: "My Profile",
                              color: Color.fromRGBO(0, 0, 0, 1),
                              size: 34,
                              weight: FontWeight.w700,
                              align: Alignment.centerLeft,
                              press: () {},
                            ),
                          ]),
                        ),
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextCenter(
                              text: "Personal details",
                              color: Color.fromRGBO(0, 0, 0, 1),
                              size: 18,
                              weight: FontWeight.normal,
                              align: Alignment.centerLeft,
                              press: () {},
                            ),
                            TextCenter(
                              text: "changed",
                              color: Color(0xffFA4A0C),
                              size: 16,
                              weight: FontWeight.w300,
                              align: Alignment.centerLeft,
                              press: () {},
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Container(
                          width: double.infinity,
                          height: 175,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.029),
                                  offset: Offset(0, 10),
                                  blurRadius: 40)
                            ],
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                          child: profilDetails(snapshot.data),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          height: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.029),
                                  offset: Offset(0, 10),
                                  blurRadius: 40)
                            ],
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                          child: singOut(),
                        ),
                        SizedBox(height: 20),
                        ButtonCenter(
                          color: Color(0xffFA4A0C),
                          press: () {},
                          text: "Update".toUpperCase(),
                          textcolor: Colors.white,
                          weight: FontWeight.w500,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                );
              }
            }));
  }

  Widget singOut() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextCenter(
          align: Alignment.center,
          color: Colors.black,
          press: () {
            Authacation().singOut();
          },
          size: 20,
          text: "Sing Out",
          weight: FontWeight.bold,
        ),
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            Authacation().singOut();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => StreamAuthProvider()));
          },
        )
      ],
    );
  }

  Widget profilDetails(Users user) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 89,
              height: 98,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  // color: Color.fromRGBO(245, 245, 248, 1),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: user.photoUrl.isNotEmpty
                          ? NetworkImage(user.photoUrl)
                          : AssetImage("assets/img/profil.png"))),
            ),
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.name.toLowerCase(),
                  style: textStyle(
                      color: Colors.black, size: 24, weight: FontWeight.bold)),
              SizedBox(height: 8),
              Text(user.email,
                  style: textStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      size: 15,
                      weight: FontWeight.w400)),
              SizedBox(height: 8),
              // TextCenter(
              //     align: Alignment.topLeft,
              //     color: Color.fromRGBO(0, 0, 0, 1),
              //     size: 15,
              //     press: () {},
              //     text: user.details,
              //     weight: FontWeight.w400),
              SizedBox(height: 8),
            ],
          )
        ],
      ),
    );
  }

  TextStyle textStyle({Color color, double size, FontWeight weight}) {
    return TextStyle(
        color: color,
        //color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'SF Pro Rounded',
        fontSize: size,
        letterSpacing: 0,
        fontWeight: weight,
        height: 1.5);
  }
}
