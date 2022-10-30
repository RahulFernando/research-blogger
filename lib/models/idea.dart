import 'package:cloud_firestore/cloud_firestore.dart';

class Idea {
  String? id;
  String description;

  Idea({this.id, required this.description});

  Idea.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        description = doc.data()!["description"];

  Map<String, dynamic> toJson() => {
        "description": description,
      };
}
