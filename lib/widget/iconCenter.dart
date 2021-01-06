import 'package:flutter/material.dart';
import 'package:food/modals/users.dart';
import 'package:food/pages/page/person.dart';

class IconCenter extends StatelessWidget {
  final String personId;

  const IconCenter({Key key, this.personId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String userId = Users().id;
    print(userId);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: double.infinity - 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
              icon:
                  Icon(Icons.shop_outlined, size: 20, color: Color(0xffB1B1B3)),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.person, size: 20, color: Color(0xffB1B1B3)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Person(
                              userId: personId,
                            )));
              },
            ),
          ],
        ),
      ),
    );
  }
}
