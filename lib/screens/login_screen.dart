import 'package:auth_app/components/auth_button.dart';
import 'package:auth_app/components/reuseable_t_feild.dart';
import 'package:auth_app/servies/auth_servies.dart';
import 'package:auth_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  final void Function()? onTap;
  const LoginScreen({super.key, required this.onTap});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //text editing controller
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final AuthServies authServies = AuthServies();

  //login method for user
  void loginUser() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      showSnackBar(context, 'Please enter both email and password.');
      return;
    }
    authServies.signInUser(
      context: context,
      email: emailController.text,
      password: passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Icon(Icons.password, size: 80, color: Colors.black),
              const SizedBox(height: 25.0),
              Text(
                'Urban Brew Login',
                style: GoogleFonts.bebasNeue(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50.0),
              //email
              ReuseableTextFelid(
                labelText: 'Email',
                controller: emailController,
                obscureText: false,
              ),
              //email
              const SizedBox(height: 10.0),
              ReuseableTextFelid(
                labelText: 'Password',
                controller: passwordController,
                obscureText: true,
              ),

              const SizedBox(height: 10.0),
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password ?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25.0),
              AuthButton(text: 'Login', onTap: loginUser),
              const SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Do not have an account?'),
                  const SizedBox(width: 5.0),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      'Register here',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
