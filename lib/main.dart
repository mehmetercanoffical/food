import 'package:flutter/material.dart';
import 'package:food/services/auth/authacation.dart';
import 'package:food/services/auth/streamAuth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => Authacation(),
      child: MaterialApp(
        title: 'Chefio',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: StreamAuthProvider(),
      ),
    );
  }
}
