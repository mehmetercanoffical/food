import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final String kategory;

  const ProductDetails({Key key, this.kategory}) : super(key: key);
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  List<String> productDetails;
  String bounch;
  String img;
  String title;
  @override
  void initState() {
    if (widget.kategory == "Foods") {
      productDetails = [
        title = "Veggie tomato mix",
        img = "assets/img/tile1.png",
        bounch = "1900",
      ];
    } else if (widget.kategory == "Drinks") {
      productDetails = [
        title = "Spicy fish sauce",
        img = "assets/img/tile2.png",
        bounch = "2300",
      ];
    } else if (widget.kategory == "Snacks") {
      productDetails = [
        title = "Veggie tomato mix",
        img = "assets/img/tile1.png",
        bounch = "1900",
      ];
      productDetails = [
        title = "Veggie tomato mix",
        img = "assets/img/tile2.png",
        bounch = "1900",
      ];
    } else if (widget.kategory == "Saunce") {
      productDetails = [
        title = "Veggie tomato mix",
        img = "assets/img/tile2.png",
        bounch = "1900",
      ];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: ListView.builder(
          itemCount: productDetails.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ProductTile(
              bounch: bounch,
              title: title,
              imgUrl: img,
            );
          },
        ));
  }
}

class ProductTile extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String bounch;

  const ProductTile({Key key, this.imgUrl, this.title, this.bounch})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return // Figma Flutter Generator Rectangle9Widget - RECTANGLE
        Container(
      width: 220,
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(57, 57, 57, 0.100),
              offset: Offset(0, 30),
              blurRadius: 60)
        ],
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 150,
              child: Image.asset(imgUrl, fit: BoxFit.cover),
            ),
            SizedBox(height: 15),
            Text(title,
                style: textStyle(
                  color: Colors.black,
                  size: 22,
                )),
            SizedBox(height: 15),
            Text(bounch,
                style: textStyle(
                  color: Color(0xffFA4A0C),
                  size: 17,
                )),
          ],
        ),
      ),
    );
  }

  TextStyle textStyle({Color color, double size}) {
    return TextStyle(
        color: color,
        //color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'SF Pro Rounded',
        fontSize: size,
        letterSpacing: 0,
        fontWeight: FontWeight.normal,
        height: 1.5);
  }
}
