import 'package:flutter/material.dart';

class CustomButton7 extends StatelessWidget {
  final String text;

  const CustomButton7({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 190,

      decoration:BoxDecoration(
          color: Color.fromARGB(255, 243, 244, 243),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(blurRadius: 10)]),
      child: TextButton(
          onPressed: () => {},
          child:Text(
            text,
            style: const TextStyle(fontSize: 24, color: Colors.black),
          )),
    );
  }
}
