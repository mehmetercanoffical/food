import 'package:flutter/material.dart';
import 'package:food/pages/page/card.dart';
import 'package:food/pages/page/products/products.dart';
import 'package:food/pages/page/search.dart';
import 'package:food/services/auth/authacation.dart';
import 'package:food/widget/iconCenter.dart';
import 'package:food/widget/searchCenter.dart';
import 'package:food/widget/textCenter.dart';

class Home extends StatefulWidget {
  final userIdHome;

  const Home({Key key, this.userIdHome}) : super(key: key);
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
                              onPressed: () {
                                Authacation().singOut();
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.shop),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddCard()));
                              },
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
                  InkWell(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        height: 390,
                        child: product[current],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            IconCenter(
              personId: widget.userIdHome,
            ),
          ],
        ),
      ),
    );
  }
}
