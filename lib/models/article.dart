import 'package:cloud_firestore/cloud_firestore.dart';

class Article {
  String? id;
  String? image;
  String description;
  String uid;
  bool? isRead = false;

  Article({this.id, required this.description, this.image, required this.uid, this.isRead});

  Article.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        image = doc.data()!["image"],
        description = doc.data()!["description"],
        uid = doc.data()!["uid"],
        isRead = doc.data()!["isRead"];

  Map<String, dynamic> toJson() => {
    "description": description,
    "image": image,
    "uid": uid,
    "isRead": isRead,
  };
}
