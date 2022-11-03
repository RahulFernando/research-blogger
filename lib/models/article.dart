import 'package:cloud_firestore/cloud_firestore.dart';

class Article {
  String? id;
  String? image;
  String description;
  String uid;

  Article({this.id, required this.description, this.image, required this.uid});

  Article.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        image = doc.data()!["image"],
        description = doc.data()!["description"],
        uid = doc.data()!["uid"];

  Map<String, dynamic> toJson() => {
    "description": description,
    "image": image,
    "uid": uid,
  };
}
