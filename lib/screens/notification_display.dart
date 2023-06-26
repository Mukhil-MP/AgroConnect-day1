//import 'package:agroconnect_day1/widget/notification_widget.dart';
import 'package:flutter/material.dart';

class NotiDisplay extends StatelessWidget {
  NotiDisplay(this.message,{super.key});
  String message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff05FF00), // Customize the app bar color
        centerTitle: true,
        title: const Text(
          "Notification",
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0), // Customize the text color
            fontWeight: FontWeight.bold, // Make the text bold
          ),
          textAlign: TextAlign.justify,
        ),
      ),
      body: Padding(
        padding:EdgeInsets.all(25),
        child: Container(
          child: Text('$message'),
        ),
      ),
    );
  }
}
