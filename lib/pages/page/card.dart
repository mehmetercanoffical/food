import 'package:flutter/material.dart';
import 'package:food/widget/textCenter.dart';

class AddCard extends StatefulWidget {
  final String imgUrl;
  final String title;
  final int bounch;

  const AddCard({Key key, this.imgUrl, this.title, this.bounch})
      : super(key: key);
  @override
  AddCardState createState() => AddCardState();
}

class AddCardState extends State<AddCard> {
  int _currentintex = 1;
  int addBounch;
  bool deleteProduct = false;
  bool showDialog = false;
  bool deleteShowDialog = false;
  @override
  void initState() {
    super.initState();
    addBounch = widget.bounch;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      color: Color(0xffF1F1F1),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      TextCenter(
                        text: "Card",
                        color: Color.fromRGBO(0, 0, 0, 1),
                        size: 34,
                        weight: FontWeight.w700,
                        align: Alignment.centerLeft,
                        press: () {},
                      ),
                      SizedBox(height: 40),
                      showDialog
                          ? showDelete(context)
                          : Container(
                              width: double.infinity,
                              height: 102,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(
                                          0, 0, 0, 0.029999999329447746),
                                      offset: Offset(0, 10),
                                      blurRadius: 40)
                                ],
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      alignment: Alignment.center,
                                      height: 90.21,
                                      width: 90.21,
                                      child: Image.asset(widget.imgUrl,
                                          fit: BoxFit.cover)),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(widget.title,
                                          style: textStyle(
                                            color: Colors.black,
                                            size: 20,
                                            weight: FontWeight.bold,
                                          )),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("$addBounch" + " TL",
                                              style: textStyle(
                                                color: Color(0xffFA4A0C),
                                                size: 19,
                                                weight: FontWeight.w600,
                                              )),
                                          SizedBox(width: 20),
                                          Container(
                                              width: 110,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: Color.fromRGBO(
                                                    250, 74, 12, 1),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  IconButton(
                                                    icon: Icon(
                                                      Icons.short_text,
                                                      color: Colors.white,
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        _currentintex =
                                                            _currentintex - 1;
                                                        addBounch = addBounch -
                                                            widget.bounch;
                                                        if (addBounch == 0) {
                                                          setState(() {
                                                            showDialog = true;
                                                          });
                                                        }
                                                      });
                                                    },
                                                  ),
                                                  TextCenter(
                                                    align: Alignment.center,
                                                    color: Colors.white,
                                                    press: () {},
                                                    size: 16,
                                                    text: "$_currentintex",
                                                    weight: FontWeight.w600,
                                                  ),
                                                  IconButton(
                                                    icon: Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        _currentintex =
                                                            _currentintex + 1;
                                                        addBounch = addBounch +
                                                            widget.bounch;
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ))
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget showDelete(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
          child: Container(
              width: double.infinity,
              height: 252,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      alignment: Alignment.center,
                      width: 315,
                      height: 66,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        color: Color.fromRGBO(236, 236, 236, 1),
                      ),
                      child: Text(widget.title,
                          style: textStyle(
                              color: Colors.black,
                              size: 20,
                              weight: FontWeight.w800))),
                  SizedBox(height: 30),
                  Text("Are you sure?",
                      style: textStyle(
                          color: Colors.black,
                          size: 20,
                          weight: FontWeight.w800)),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: TextCenter(
                          align: Alignment.center,
                          color: Colors.black,
                          press: () {
                            setState(() {
                              _currentintex = _currentintex + 1;
                              addBounch = addBounch + widget.bounch;
                            });
                          },
                          size: 16,
                          text: "Cancel",
                          weight: FontWeight.w500,
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            setState(() {
                              deleteProduct = true;
                            });
                          },
                          child: Container(
                              alignment: Alignment.center,
                              width: 159,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color.fromRGBO(250, 74, 12, 1),
                              ),
                              child: Text("Delete",
                                  style: textStyle(
                                      color: Colors.white,
                                      size: 20,
                                      weight: FontWeight.w700))),
                        ),
                      )
                    ],
                  )
                ],
              ))),
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
