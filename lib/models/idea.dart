import 'package:cloud_firestore/cloud_firestore.dart';

class Idea {
  String? id;
  String description;
  String uid;

  Idea({this.id, required this.description, required this.uid});

  Idea.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        description = doc.data()!["description"],
        uid = doc.data()!["uid"];

  Map<String, dynamic> toJson() => {
        "description": description,
        "uid": uid,
      };
}
