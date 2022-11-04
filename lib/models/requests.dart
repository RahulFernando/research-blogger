import 'package:cloud_firestore/cloud_firestore.dart';

class Requests {
  String? id;
  String title;
  String language;
  String message;
  String uid;

  Requests(
      {this.id,
      required this.title,
      required this.language,
      required this.message,
      required this.uid});

  Requests.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        title = doc.data()!["title"],
        language = doc.data()!["language"],
        message = doc.data()!["message"],
        uid = doc.data()!["uid"];

  Map<String, dynamic> toJson() => {
        "title": title,
        "language": language,
        "message": message,
        "uid": uid,
      };
}
