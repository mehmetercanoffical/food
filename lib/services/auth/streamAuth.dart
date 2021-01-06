import 'package:flutter/material.dart';
import 'package:food/modals/users.dart';
import 'package:food/pages/login/homeLogin.dart';
import 'package:food/pages/page/home.dart';
import 'package:food/pages/onHome.dart';
import 'package:food/services/auth/authacation.dart';

class StreamAuthProvider extends StatelessWidget {
  Users user = Users();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Authacation().onChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return OnHome();
          }
          if (snapshot.hasData) {
            Users users = snapshot.data;
            Authacation().activeUser = users.id;
            // print(Authacation().activeUser);
            //print(user.id);
            return Home(
              userIdHome: users.id,
            );
          } else {
            return HomeLogin();
          }
        });
  }
}
