import 'package:flutter/material.dart';

class Notification_Widget extends StatefulWidget {

  final String Date;
  final int index;


  const Notification_Widget({super.key,
  required this.Date,
  required this.index,});

  @override
  State<Notification_Widget> createState() => _notificationState();
}



class _notificationState extends State<Notification_Widget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF05FF00), width: 3),
               
  ),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
     children: [
      Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.centerRight,
        child: Container(
          // padding: const EdgeInsets.only(top: 20, right: 20),
          height: 22,
          width: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
          ),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("  New",
              style: TextStyle(color: Colors.black,
              fontSize: 15),),
            ],
          ),
        ),
      ),
      Row(
        
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Text("Notification ${widget.index}",
        style: TextStyle(
          fontSize: 20
        ),)
        ]
        ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(widget.Date)
        ],
      )
      
     ],
  ),

    );
  }
}