import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String? id;
  String? uid;
  String? userName;
  String? age;

  User({this.id, this.uid, this.userName, this.age});

  User.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        uid = doc.data()!["uid"],
        userName = doc.data()!["userName"],
        age = doc.data()!["age"];

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "userName": userName,
        "age": age,
      };
}
