import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food/modals/users.dart';

class CloudStore {
  final Firestore cloud = Firestore.instance;
  DateTime time = DateTime.now();

  Future<void> cloudUserCreate({id, name, email, photoUrl = ""}) async {
    await cloud.collection("kullanicilar").document(id).setData({
      "id": id,
      "name": name,
      "email": email,
      "photoUrl": photoUrl,
      "details": "",
      "time": time
    });
  }

  Future<Users> cloudUserGet({id}) async {
    DocumentSnapshot doc =
        await cloud.collection("kullanicilar").document(id).get();
    if (doc.exists) {
      Users user = Users.cloudCreateUser(doc: doc);
      return user;
    }
    return null;
  }

  Future<void> productDetailsWrite({title, imgUrl, descp, id, bounc}) async {
    await cloud.collection("productDetails").document(id).setData({
      "id": id,
      "title": title,
      "imgUrl": imgUrl,
      "descp": descp,
      "bounc": bounc,
    });
  }

  Future<void> productGet(id) async {
    DocumentSnapshot snapshot =
        await cloud.collection("productDetails").document(id).get();
  }
}
