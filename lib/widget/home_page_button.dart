import 'package:flutter/material.dart';

class HomePageButtton extends StatelessWidget {
  const HomePageButtton({
    Key? key,
    required this.menuimage,
  }) : super(key: key);

  final String menuimage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 88,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff05FF00), Color.fromARGB(0, 255, 255, 255)]),
        borderRadius: BorderRadius.circular(15),
        // boxShadow: [BoxShadow(blurRadius: 70)],
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: ElevatedButton(
        onPressed: () {},
        child: Image.asset(menuimage),
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          //shadowColor: Colors.transparent,
        ),
      ),
    );
  }
}
