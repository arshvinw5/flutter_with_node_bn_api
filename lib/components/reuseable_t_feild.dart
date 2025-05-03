import 'package:flutter/material.dart';

class ReuseableTextFelid extends StatelessWidget {
  final bool obscureText;
  final TextEditingController controller;
  final String labelText;

  const ReuseableTextFelid({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,

      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        labelText: labelText,
      ),
    );
  }
}
