import 'package:flutter/material.dart';

class customButton2 extends StatelessWidget {
  final String text;

  const customButton2({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 300,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(54),
          boxShadow: [BoxShadow(blurRadius: 10)]),
      child: TextButton(
          onPressed: () => {},
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 28, color: Colors.black, fontWeight: FontWeight.w900),
          )),
    );
  }
}
