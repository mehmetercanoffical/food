import 'package:flutter/material.dart';
import 'package:food/widget/searchCenter.dart';

class Search extends StatefulWidget {
  final String text;

  const Search({Key key, this.text}) : super(key: key);
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Color(0xffB1B1B3),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                child: SearchCenter(
                  controller: controller,
                  icon: Icons.search,
                  press: () {},
                  title: widget.text,
                ),
              ),
            ],
          ),
        ],
      ),
    )));
  }
}
