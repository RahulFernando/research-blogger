import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import '../utils/colorUtils.dart';
import '../widgets/AuthOption.dart';
import '../widgets/Button.dart';
import '../widgets/Logo.dart';
import '../widgets/TextField.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // controllers
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
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
                reusableTextField("Enter Email", Icons.email_sharp, false,
                    _emailController, TextInputType.emailAddress),
                const SizedBox(height: 20,),
                reusableTextField("Enter Age", Icons.timelapse_sharp, false,
                    _ageController, TextInputType.text),
                const SizedBox(height: 20,),
                reusableTextField("Enter Password", Icons.lock, true,
                    _passwordNameController, TextInputType.visiblePassword),
                const SizedBox(height: 20,),
                reusableAuthButton(context, "SIGN UP", () => {}),
                const SizedBox(height: 25,),
                authOption("Already have an account? ", "Sign In", () => Navigator.pushNamed(context, SIGN_IN_SCREEN)),
                const SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
