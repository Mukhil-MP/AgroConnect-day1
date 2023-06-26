import 'package:agroconnect_day1/widget/notification_widget.dart';
import 'package:flutter/material.dart';

class memberNotification extends StatefulWidget {
  memberNotification({super.key, required this.myData});
  List myData;

  @override
  State<memberNotification> createState() => _memberNotification();
}

class _memberNotification extends State<memberNotification> {
  List<Widget> listMyData(data) {
    List<Widget> myList = [];
    for (int i = 0; i < data.length; i++) {
      print(data);
      // print(data['createdAt']);
      myList.add(Notification_Widget(
          Date: data[i]['createdAt'],
          index: i + 1,
          message: data[i]['notification']));
    }
    return myList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff05FF00), // Customize the app bar color
        centerTitle: true,
        title: const Text(
          "Ward Member's Notification",
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0), // Customize the text color
            fontWeight: FontWeight.bold, // Make the text bold
          ),
        ),
      ),
      body: ListView(
        children: [...listMyData(widget.myData)],
      ),
    );
  }
}
