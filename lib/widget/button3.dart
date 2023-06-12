import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class customButton3 extends StatelessWidget {
  final String text;
  final String address;

  const customButton3({
    Key? key,
    required this.text,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 73,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [BoxShadow(blurRadius: 10)]),
      child: TextButton(
          onPressed: () => launchUrlString(address),
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(),
                  height: 39,
                  width: 50,
                  child: Image.asset("assets/images/doc.png")),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 8,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
            ],
          )),
    );
  }
}
