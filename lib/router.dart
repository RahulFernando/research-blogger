import 'package:flutter/material.dart';
import 'package:research_blogger/constants.dart';
import 'package:research_blogger/screens/home.dart';
import 'package:research_blogger/screens/signIn.dart';
import 'package:research_blogger/screens/signUp.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SIGN_IN_SCREEN:
        return MaterialPageRoute(builder: (_) => const SignIn());
      case SIGN_UP_SCREEN:
        return MaterialPageRoute(builder: (_) => const SignUp());
      case HOME_SCREEN:
        return MaterialPageRoute(builder: (_) => const Home());
      default:
        return MaterialPageRoute(builder: (_) => const SignIn());
    }
  }
}
