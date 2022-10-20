import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:research_blogger/models/response.dart';
import 'package:research_blogger/models/user.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collectionReference = _firestore.collection("users");

class UserService {
  static Future<Response> create(User user) async {
    Response response = Response();

    DocumentReference documentReference = _collectionReference.doc();

    await documentReference.set(user.toJson()).whenComplete(() {
      response.status = 201;
      response.message = "User created successfully!";
    }).catchError((e) {
      response.status = 500;
      response.message = e.toString();
    });

    return response;
  }
}
