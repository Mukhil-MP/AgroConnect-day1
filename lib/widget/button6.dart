import 'package:flutter/material.dart';

class CustomButton6 extends StatelessWidget {
  final String text;
  final VoidCallback func;

  const CustomButton6({
    Key? key,
    required this.text,
    required this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 150,
      decoration: BoxDecoration(
          color: Color(0xff05FF00),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(blurRadius: 10)]),
      child: TextButton(
          onPressed: func,
          child: Text(
            text,
            style: const TextStyle(fontSize: 24, color: Colors.black),
          )),
    );
  }
}
