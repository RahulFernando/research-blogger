import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:research_blogger/models/article.dart';
import 'package:research_blogger/models/idea.dart';
import 'package:research_blogger/models/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collectionReference = _firestore.collection("articles");

class ArticleService {
  static Future<Response> create(Article article) async {
    Response response = Response();

    DocumentReference documentReference = _collectionReference.doc();

    await documentReference.set(article.toJson()).then((doc) {
      response.status = 201;
      response.message = "Article added successfully!";
    }).catchError((e) {
      response.status = 500;
      response.message = e.toString();
    });

    return response;
  }
}