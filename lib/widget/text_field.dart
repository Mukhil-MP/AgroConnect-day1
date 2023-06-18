import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labeltext;

  const CustomTextField({
    Key? key,
    required this.labeltext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 48, right: 48),
      child: TextField(
        
        decoration: InputDecoration(
          labelText: labeltext,
          labelStyle: const TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}
