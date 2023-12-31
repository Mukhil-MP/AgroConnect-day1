import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labeltext;
  final TextEditingController controller;
  final bool obscureText;
  const CustomTextField({
    Key? key,
    required this.labeltext,
    required this.controller, required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 48, right: 48),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          labelText: labeltext,
          labelStyle: const TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}
