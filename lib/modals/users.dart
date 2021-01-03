import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Users {
  final String id;
  final String name;
  final String email;
  final String photoUrl;
  final String details;

  Users({this.id, this.name, this.email, this.photoUrl, this.details});

  factory Users.createUser(FirebaseUser user) {
    return Users(
      id: user.uid,
      email: user.email,
      name: user.displayName,
      details: "",
      photoUrl: user.photoUrl,
    );
  }

  factory Users.cloudCreateUser({DocumentSnapshot doc}) {
    return Users(
        id: doc.documentID,
        name: doc.data["name"],
        email: doc.data["email"],
        photoUrl: doc.data["email"],
        details: doc.data["details"]);
  }
}
