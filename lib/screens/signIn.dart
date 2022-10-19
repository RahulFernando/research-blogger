import 'package:flutter/material.dart';
import 'package:research_blogger/constants.dart';
import 'package:research_blogger/utils/colorUtils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:research_blogger/widgets/AuthOption.dart';
import 'package:research_blogger/widgets/Button.dart';
import 'package:research_blogger/widgets/Logo.dart';
import 'package:research_blogger/widgets/TextField.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // controllers
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [hexStringToColor("1488cc"), hexStringToColor("2b32b2")],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: [
                reusableLogo("assets/images/logo.png"),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Sign In",
                  style:
                      GoogleFonts.ptSans(fontSize: 22.0, color: Colors.white),
                ),
                const SizedBox(
                  height: 50,
                ),
                reusableTextField("Enter Username", Icons.verified_user, false,
                    _userNameController, TextInputType.name),
                const SizedBox(height: 20,),
                reusableTextField("Enter Password", Icons.lock, true,
                    _passwordNameController, TextInputType.visiblePassword),
                const SizedBox(height: 20,),
                reusableAuthButton(context, "SIGN IN", () => {}),
                const SizedBox(height: 25,),
                authOption("Don't have an account? ", "Sign Up", () => Navigator.pushNamed(context, SIGN_UP_SCREEN)),
                const SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
