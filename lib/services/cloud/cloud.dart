import 'package:cloud_firestore/cloud_firestore.dart';

class CloudStore {
  final Firestore cloud = Firestore.instance;
  DateTime time = DateTime.now();

  Future<void> cloudUserCreate({id, name, email}) async {
    await cloud.collection("kullanicilar").document(id).setData({
      "id": id,
      "name": name,
      "email": email,
      "photoUrl": "",
      "details": "",
      "time": time
    });
  }
}
