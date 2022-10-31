import 'package:cloud_firestore/cloud_firestore.dart';

class Research {
  String? id;
  String category;
  String description;

  Research({this.id, required this.category, required this.description});

  Research.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        category = doc.data()!["category"],
        description = doc.data()!["description"];

  Map<String, dynamic> toJson() => {
        "category": category,
        "description": description,
      };
}
