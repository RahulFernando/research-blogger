import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:research_blogger/models/rate.dart';

import '../models/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collectionReference = _firestore.collection(
    "ratings");

class RatingService {
  static Future<Response> create(Rate rate) async {
    Response response = Response();

    await _collectionReference.add(rate.toJson()).then((doc) {
      response.status = 201;
      response.message = "Your comment added!";
      response.data = doc.id;
    }).catchError((e) {
      response.status = 500;
      response.message = e.toString();
    });

    return response;
  }
}