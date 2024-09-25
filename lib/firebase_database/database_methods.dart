import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserData(Map<String, dynamic> usedata, String id) async {
    return await FirebaseFirestore.instance
        .collection('User')
        .doc(id)
        .set(usedata);
  }

  Future<Stream<QuerySnapshot>> getUserData() async {
    return await FirebaseFirestore.instance.collection("User").snapshots();
  }

  Future updateUserData(String id, Map<String, dynamic> updatedUserData) async {
    return await FirebaseFirestore.instance
        .collection('User')
        .doc(id)
        .update(updatedUserData);
  }

  Future deleteUserData(String id) async {
    return await FirebaseFirestore.instance.collection('User').doc(id).delete();
  }
}
