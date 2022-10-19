import 'package:flutter/material.dart';
import 'package:research_blogger/screens/signIn.dart';
import 'package:research_blogger/screens/signUp.dart';
import './constants.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SIGN_IN_SCREEN:
        return MaterialPageRoute(builder: (_) => const SignIn());
      case SIGN_UP_SCREEN:
        return MaterialPageRoute(builder: (_) => const SignUp());
      default:
        return MaterialPageRoute(builder: (_) => const SignIn());
    }
  }
}
