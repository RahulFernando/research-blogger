import 'package:firebase_auth/firebase_auth.dart';

import '../models/response.dart';

class AuthService {
  static Future<Response> register(
      {required String email, required String password}) async {
    Response response = Response();

    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((res) {
          response.status = 201;
          response.message = "User registered successfully!";
          response.data = res.user;
    }).catchError((e) {
      response.status = 500;
      response.message = e.toString();
    });

    return response;
  }
}
