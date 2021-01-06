import 'package:flutter/material.dart';
import 'package:food/pages/page/card.dart';
import 'package:food/widget/buttonCenter.dart';
import 'package:food/widget/textCenter.dart';

class Product extends StatefulWidget {
  final String title;
  final String img;
  final int bouch;

  const Product({Key key, this.title, this.img, this.bouch}) : super(key: key);
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  bool isIconFavority = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xffF1F1F1),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
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
                    InkWell(
                      onDoubleTap: () {
                        setState(() {
                          isIconFavority = false;
                        });
                      },
                      child: IconButton(
                        icon: isIconFavority
                            ? Icon(Icons.favorite)
                            : Icon(Icons.favorite_outline),
                        onPressed: () {
                          setState(() {
                            isIconFavority = true;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                // BURASI PAGEVİEW OLUCAK
                Container(
                  alignment: Alignment.bottomCenter,
                  width: 190,
                  height: 190,
                  padding: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.all(Radius.elliptical(
                      180,
                      180,
                    )),
                  ),
                  child: Image.asset(widget.img, fit: BoxFit.cover),
                ),
                SizedBox(height: 30),
                Text(
                  widget.title,
                  style: textStyle(
                      color: Colors.black, size: 22, weight: FontWeight.w700),
                ),
                SizedBox(height: 15),
                Text(
                  widget.bouch.toString() + " Tl",
                  style: textStyle(
                      color: Color(0xffFA4A0C),
                      size: 18,
                      weight: FontWeight.w700),
                ),
                SizedBox(height: 25),
                Column(
                  children: [
                    boldText(
                      txt: "Deliver Info",
                      press: () {},
                    ),
                    SizedBox(height: 20),
                    MediumText(
                        txt:
                            "Delivered between monday aug and thursday 20 from 8pm to 91:32 pm",
                        press: () {}),
                    SizedBox(height: 10),
                    boldText(
                      txt: "Return policy",
                      press: () {},
                    ),
                    SizedBox(height: 10),
                    MediumText(
                        txt:
                            "All our foods are double checked before leaving our stores so by any case you found a broken food please contact our hotline immediately.",
                        press: () {}),
                    SizedBox(height: 40),
                    ButtonCenter(
                      color: Color(0xffFA4A0C),
                      press: addCard,
                      size: 18,
                      text: "Add to Card",
                      textcolor: Colors.white,
                      weight: FontWeight.w700,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addCard() async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddCard(
                  bounch: widget.bouch,
                  imgUrl: widget.img,
                  title: widget.title,
                )));
  }

  TextCenter MediumText({String txt, Function press}) {
    return TextCenter(
      align: Alignment.centerLeft,
      color: Colors.grey,
      press: press,
      size: 17,
      text: txt,
      weight: FontWeight.w600,
    );
  }

  TextCenter boldText({String txt, Function press}) {
    return TextCenter(
      align: Alignment.centerLeft,
      color: Colors.black,
      press: press,
      size: 17,
      text: txt,
      weight: FontWeight.w600,
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
