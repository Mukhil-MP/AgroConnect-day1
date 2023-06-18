//import 'package:agroconnect_day1/widget/text_field.dart';
import 'package:agroconnect_day1/screens/login_sigin.dart';
import 'package:flutter/material.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginSign()),
      );
    });

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff05FF00), Color(0xff000000)]),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 21, right: 21),
            height: MediaQuery.of(context).size.height,
            child: Image.asset("assets/images/agroconnect_text.png"),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: MediaQuery.of(context).size.height,
            child: Image.asset('assets/images/pashu.png'),
          ),
        ],
      ),
    );
  }
}
