import 'package:flutter/material.dart';

class CustomButton5 extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton5({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 200,
      decoration: BoxDecoration(
        color: const Color(0xff05FF00),
        borderRadius: BorderRadius.circular(54),
        boxShadow: const [BoxShadow(blurRadius: 10)],
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}
