import 'package:firebase_auth/firebase_auth.dart';
import 'package:food/modals/users.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authacation {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String activeUser;
  Users userCreate(FirebaseUser user) {
    return user == null ? null : Users.createUser(user);
  }

  Stream<Users> get onChanged {
    return auth.onAuthStateChanged.map(userCreate);
  }

  Future<Users> singIn(String email, String password) async {
    AuthResult result =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    return userCreate(result.user);
  }

  Future<Users> singUp(String email, String password) async {
    AuthResult result = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCreate(result.user);
  }

  singOut() async {
    await auth.signOut();
  }

  Future<Users> google() async {
    GoogleSignInAccount account = await GoogleSignIn().signIn();
    GoogleSignInAuthentication accountGoogle = await account.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: accountGoogle.idToken, accessToken: accountGoogle.accessToken);
    AuthResult result = await auth.signInWithCredential(credential);
    return userCreate(result.user);
  }
}
