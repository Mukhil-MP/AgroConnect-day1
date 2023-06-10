//import 'package:agroconnect_day1/screens/start.dart';
// import 'package:agroconnect_day1/screens/enter_details.dart';
import 'package:agroconnect_day1/screens/login_sigin.dart';
import 'package:flutter/material.dart';
// import 'package:agroconnect_day1/screens/login_sigin.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: LoginSign(),
      ),
    );
  }
}
