import 'package:flutter/material.dart';
import 'package:research_blogger/constants.dart';
import 'package:research_blogger/screens/signIn.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case SIGN_IN_SCREEN:
        return MaterialPageRoute(builder: (_) => const SignIn());
      default:
        return MaterialPageRoute(builder: (_) => const SignIn());
    }
  }
}