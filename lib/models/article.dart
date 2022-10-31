import 'package:cloud_firestore/cloud_firestore.dart';

class Article {
  String? id;
  String? image;
  String description;

  Article({this.id, required this.description, this.image});

  Article.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        image = doc.data()!["image"],
        description = doc.data()!["description"];

  Map<String, dynamic> toJson() => {
    "description": description,
    "image": image,
  };
}
