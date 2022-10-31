import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:research_blogger/models/research.dart';
import 'package:research_blogger/models/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collectionReference = _firestore.collection("researches");

class ResearchService {
  static Future<Response> create(Research research) async {
    Response response = Response();

    DocumentReference documentReference = _collectionReference.doc();

    await documentReference.set(research.toJson()).then((doc) {
      response.status = 201;
      response.message = "Research added successfully!";
    }).catchError((e) {
      response.status = 500;
      response.message = e.toString();
    });

    return response;
  }
}