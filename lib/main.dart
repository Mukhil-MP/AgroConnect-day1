//import 'package:agroconnect_day1/screens/start.dart';
// import 'package:agroconnect_day1/screens/enter_details.dart';
//import 'package:agroconnect_day1/screens/login_sigin.dart';
//import 'package:agroconnect_day1/screens/enter_details.dart';
//import 'package:agroconnect_day1/screens/edit_details.dart';
//import 'package:agroconnect_day1/screens/create_password.dart';
//import 'package:agroconnect_day1/screens/enter_det.dart';
//import 'package:agroconnect_day1/screens/edit_details.dart';
//import 'package:agroconnect_day1/screens/id_verification.dart';
//import 'package:agroconnect_day1/screens/enter_details.dart';
//import 'package:agroconnect_day1/screens/enter_details.dart';
// import 'package:agroconnect_day1/screens/id_verification.dart';
//import 'package:agroconnect_day1/screens/user_selection.dart';
import 'package:agroconnect_day1/screens/id_verification.dart';
//import 'package:agroconnect_day1/screens/user_selection.dart';
//import 'package:agroconnect_day1/screens/create_password.dart';
import 'package:agroconnect_day1/screens/bank.dart';
import 'package:agroconnect_day1/screens/otp.dart';
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
        body: IdVerification(),

      ),
    );
  }
}
