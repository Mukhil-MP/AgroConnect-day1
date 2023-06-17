import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback func;

  const CustomButton({
    Key? key,
    required this.text, required this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 200,

      decoration:BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(54),
          boxShadow: const [BoxShadow(blurRadius: 10)]),
      child: TextButton(
          onPressed: func,
          child:Text(
            text,
            style: const TextStyle(fontSize: 24, color: Colors.black),
          )),
    );
  }
}
