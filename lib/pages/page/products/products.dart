import 'package:flutter/material.dart';
import 'package:food/pages/page/products/productDetail.dart';
import 'package:food/widget/textCenter.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    controller = TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          indicatorColor: Color(0xffFF4B3A),
          isScrollable: true,
          unselectedLabelColor: Colors.black,
          labelColor: Color(0xffFF4B3A),
          labelStyle: TextStyle(
              fontFamily: 'SF Pro Text',
              fontSize: 17,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1),
          controller: controller,
          tabs: [
            Tab(text: "Foods"),
            Tab(text: "Drinks"),
            Tab(text: "Snacks"),
            Tab(text: "Sauce"),
          ],
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(15),
          height: 300,
          width: double.infinity,
          child: TabBarView(
            controller: controller,
            children: [
              ProductDetails(kategory: "Foods"),
              ProductDetails(kategory: "Drinks"),
              ProductDetails(kategory: "Snacks"),
              ProductDetails(kategory: "Saunce"),
            ],
          ),
        )
      ],
    );
  }
}
