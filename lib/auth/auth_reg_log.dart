import 'package:auth_app/screens/login_screen.dart';
import 'package:auth_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class LoginOrReg extends StatefulWidget {
  const LoginOrReg({super.key});

  @override
  _LoginOrRegState createState() => _LoginOrRegState();
}

class _LoginOrRegState extends State<LoginOrReg> {
  //initially, show login screen
  bool showLoginScreen = true;

  //toggle between login and registration screen

  void toggleScreen() {
    setState(() {
      //when toggle to make it false
      showLoginScreen = !showLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginScreen) {
      return LoginScreen(onTap: toggleScreen);
    } else {
      return RegistrationScreen(onTap: toggleScreen);
    }
  }
}
