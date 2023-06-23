import 'package:agroconnect_day1/widget/notification_widget.dart';
import 'package:flutter/material.dart';

class memberNotification extends StatefulWidget {
  const memberNotification({super.key});

  @override
  State<memberNotification> createState() => _memberNotificationState();
}

class _memberNotificationState extends State<memberNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor:const  Color(0xff05FF00), // Customize the app bar color
          centerTitle: true,
          title: const Text(
            "Ward Member's Notification",
            style:TextStyle(
              color: Color.fromARGB(255, 0, 0, 0), // Customize the text color
              fontWeight: FontWeight.bold, // Make the text bold
            ),
          ),),
      body: Notification_Widget(Date: "23/06/2023",index: 2,
      ),
    );
  }
}