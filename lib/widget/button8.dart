import 'package:flutter/material.dart';

class CustomButton8 extends StatelessWidget {
  final String text;

  const CustomButton8({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 110,
      decoration: BoxDecoration(
          color: const Color(0xff05FF00),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [BoxShadow(blurRadius: 10)]),
      child: TextButton(
          onPressed: () => {},
          child: Text(
            text,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          )),
    );
  }
}
