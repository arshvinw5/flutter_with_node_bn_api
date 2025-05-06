import 'package:auth_app/components/auth_button.dart';
import 'package:auth_app/provider/user_provider.dart';
import 'package:auth_app/servies/auth_servies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void signedout(BuildContext context) {
    AuthServies().sighnOutUser(context);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text(user.name, style: TextStyle(color: Colors.black))),
          Center(
            child: Text(user.email, style: TextStyle(color: Colors.black)),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AuthButton(
              text: "Sign Out",
              onTap: () => signedout(context),
            ),
          ),
        ],
      ),
    );
  }
}
