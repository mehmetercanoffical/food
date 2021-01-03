import 'package:flutter/material.dart';
import 'package:food/pages/page/products/products.dart';
import 'package:food/pages/page/search.dart';
import 'package:food/widget/iconCenter.dart';
import 'package:food/widget/searchCenter.dart';
import 'package:food/widget/textCenter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int current = 0;
  TextEditingController controller = TextEditingController();
  List<Widget> product;
  @override
  void initState() {
    product = [Products()];
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.clear();
  }

  List<Widget> iconData = [
    IconButton(
        icon: Icon(Icons.home, size: 30, color: Color(0xffFA4A0C)),
        onPressed: () {}),
    IconButton(
        icon: Icon(
          Icons.send_rounded,
          size: 20,
          color: Color(0xffB1B1B3),
        ),
        onPressed: () {}),
    IconButton(
      icon: Icon(Icons.shop_outlined, size: 20, color: Color(0xffB1B1B3)),
      onPressed: () {},
    ),
    IconButton(
      icon: Icon(Icons.person, size: 20, color: Color(0xffB1B1B3)),
      onPressed: () {},
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xffF1F1F1),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 30),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: Icon(Icons.menu),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.shop),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        TextCenter(
                          align: Alignment.topLeft,
                          press: () {},
                          text: "Delicious\nfood for you",
                          size: 30,
                          weight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        SizedBox(height: 30),
                        SearchCenter(
                          controller: controller,
                          press: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Search(
                                          text: controller.text,
                                        )));
                          },
                          icon: Icons.search,
                          title: "Search",
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      height: 390,
                      child: product[current],
                    ),
                  ),
                ],
              ),
            ),
            IconCenter(),
          ],
        ),
      ),
    );
  }
}
