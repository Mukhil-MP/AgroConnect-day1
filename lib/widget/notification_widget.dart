import 'package:agroconnect_day1/screens/notification_display.dart';
import 'package:flutter/material.dart';

class Notification_Widget extends StatefulWidget {
  final String Date;
  final int index;
  final String message;

  const Notification_Widget(
      {super.key,
      required this.Date,
      required this.index,
      required this.message});

  @override
  State<Notification_Widget> createState() => _notificationState();
}

class _notificationState extends State<Notification_Widget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return NotiDisplay(widget.message);
                        },
                      ));
      },
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF05FF00), width: 3),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(
                "Notification ${widget.index}",
                style: TextStyle(fontSize: 20),
              )
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text(widget.Date)],
            )
          ],
        ),
      ),
    );
  }
}
