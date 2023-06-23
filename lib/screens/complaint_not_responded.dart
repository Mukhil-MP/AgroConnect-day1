import 'package:agroconnect_day1/widget/button8.dart';
import 'package:agroconnect_day1/widget/button9.dart';
import 'package:flutter/material.dart';

//import '../widget/text_field.dart';

class NotResponded extends StatelessWidget {
  const NotResponded({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color.fromARGB(255, 255, 255, 255)]),
            ),
          ),
          Container(
              //padding: const EdgeInsets.only(left: 21, right: 21),
              margin: const EdgeInsets.only(top: 100, left: 17),
              // height: 205,
              // width: 300,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Text(
                "Complaint(s) that have been read and not responded",
                style: TextStyle(fontStyle: FontStyle.italic),
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      // margin: const EdgeInsets.only(top: 30),
                      child: const CustomButton9(text: "Complaints recieved")),
                  Container(
                      //margin: const EdgeInsets.only(top: 30),
                      child: const CustomButton8(
                          text: "Complaints not responded")),
                  Container(
                      // margin: const EdgeInsets.only(top: 30),
                      child: const CustomButton9(text: "History")),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(right: 150, top: 100),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Compliant 1",
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 150, top: 10),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Compliant 2",
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 150, top: 10),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Compliant 3",
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
