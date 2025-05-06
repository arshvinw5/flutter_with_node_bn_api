import 'package:auth_app/auth/auth_reg_log.dart';
import 'package:auth_app/models/user.dart';
import 'package:auth_app/provider/user_provider.dart';
import 'package:auth_app/screens/home_screen.dart';
import 'package:auth_app/servies/auth_servies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  final AuthServies authServies = AuthServies();
  @override
  initState() {
    super.initState();
    authServies.getUserData(context);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home:
          Provider.of<UserProvider>(context).user.token.isNotEmpty
              ? const LoginOrReg()
              : const HomeScreen(),
    );
  }
}
