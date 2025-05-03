import 'package:auth_app/components/auth_button.dart';
import 'package:auth_app/components/reuseable_t_feild.dart';
import 'package:auth_app/servies/auth_servies.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationScreen extends StatefulWidget {
  final void Function()? onTap;
  const RegistrationScreen({super.key, required this.onTap});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  //text editing controller
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final AuthServies authServies = AuthServies();

  //sign user up method

  void signUpUser() async {
    authServies.signUpUser(
      context: context,
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
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
              Icon(Icons.person, size: 80, color: Colors.black),
              const SizedBox(height: 25.0),
              Text(
                'Urban Brew User Registration',
                style: GoogleFonts.bebasNeue(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 50.0),
              //email
              ReuseableTextFelid(
                labelText: 'Name',
                controller: nameController,
                obscureText: false,
              ),
              //email
              const SizedBox(height: 25.0),
              ReuseableTextFelid(
                labelText: 'Email',
                controller: emailController,
                obscureText: false,
              ),
              //email
              const SizedBox(height: 25.0),
              ReuseableTextFelid(
                labelText: 'Password',
                controller: passwordController,
                obscureText: true,
              ),
              const SizedBox(height: 25.0),
              ReuseableTextFelid(
                labelText: 'Confirm Password',
                controller: confirmPasswordController,
                obscureText: true,
              ),
              //email
              const SizedBox(height: 25.0),
              AuthButton(text: 'Register', onTap: signUpUser),
              const SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('You have an account?'),
                  const SizedBox(width: 5.0),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      'Login',
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
