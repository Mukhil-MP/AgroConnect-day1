import 'dart:convert';

import 'package:agroconnect_day1/screens/agricultural_officer_noti.dart';
import 'package:agroconnect_day1/screens/bank.dart';
import 'package:agroconnect_day1/screens/complaint_r.dart';
import 'package:agroconnect_day1/screens/farmer_menu.dart';
import 'package:agroconnect_day1/screens/laws.dart';
import 'package:agroconnect_day1/screens/member_notification.dart';
import 'package:agroconnect_day1/screens/wa_menu.dart';
import 'package:agroconnect_day1/screens/weather.dart';
import 'package:agroconnect_day1/screens/whatsapp.dart';
import 'package:flutter/material.dart';
import 'package:agroconnect_day1/widget/home_page_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:dio/dio.dart';

import 'complaints_received.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.number, required this.role});
  String number;
  String role;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dio = Dio();
  List<dynamic> temp = [];
  int officerNo = 0;
  int wardNo = 0;
  var message;
  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    print('start');
    Response response = (await dio
        .get('https://argo-backend.onrender.com/api/v1/scrapper/fetchdata'));
    print(response);
    Map<String, dynamic> requestBody = {
      "mobileNumber": widget.number,
    };
    Response res1 = (await dio.post(
        'https://argo-backend.onrender.com/api/v1/user/notify/view',
        data: requestBody));
    // debugPrint(jsonEncode(response));
    print(res1);
    setState(() {
      temp = response.data['data'];
      officerNo = res1.data['officer_no'] ?? 0;
      wardNo = res1.data['ward_no'] ?? 0;
      message = res1.data;
    });
    print(temp);
    print('end');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset("assets/images/sky.png"),
        Container(
          alignment: Alignment.bottomCenter,
          height: MediaQuery.of(context).size.height,
          child: Image.asset('assets/images/farmer.png'),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HomePageButtton(
                      menuimage: "assets/images/menu.png",
                      func: () => {
                            if (widget.role == 'farmer')
                              {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FarmerMenu(
                                          number: widget.number,
                                          role: widget.role),
                                    ))
                              }
                            else
                              {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => WardOffiMenu(
                                          number: widget.number,
                                          role: widget.role),
                                    ))
                              }
                          }),
                  Image.asset(
                    "assets/images/agroconnect_text.png",
                    height: 34,
                    width: 167,
                  ),
                  HomePageButtton(
                      menuimage: "assets/images/chat.png",
                      func: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const WhatsApp(),
                                ))
                          }),
                ],
              ),
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff05FF00),
                      Color.fromARGB(0, 255, 255, 255)
                    ]),
                // boxShadow: [BoxShadow(blurRadius: 70)],
                border: Border.all(
                    width: 2, color: Color.fromARGB(255, 154, 154, 154)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          print(message);
                          return officerNotification(
                            myData: message['officerNotify'] ?? [],
                          );
                        },
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: Colors.transparent,
                      //shadowColor: Colors.transparent,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Agricultural Officer",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 165,
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 207, 4, 21),
                          ),
                          child: Center(
                            child: Text(
                              '$officerNo',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          print(message);
                          return memberNotification(
                            myData: message['wardMemberNotify'] ?? [],
                          );
                        },
                      ));
                    },
                    child: Row(
                      children: [
                        Text(
                          "Ward Member",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 200,
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 207, 4, 21),
                          ),
                          child: Center(
                            child: Text(
                              '$wardNo',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HomePageButtton(
                      menuimage: "assets/images/sun.png",
                      func: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Weather(),
                                ))
                          }),
                  HomePageButtton(
                      menuimage: "assets/images/bank2.png",
                      func: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Bank(),
                                ))
                          }),
                  HomePageButtton(
                      menuimage: "assets/images/law2.png",
                      func: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const laws(),
                                ))
                          })
                ],
              ),
            ),

//news and notifiaction

            Container(
              margin: EdgeInsets.only(top: 10),
              height: 340,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                      color: Colors.green.withOpacity(0.5),
                      blurRadius: 3,
                      spreadRadius: -5,
                      offset: Offset(-2, -2))
                ],
              ),
              child: ListView.builder(
                itemCount: temp.length,
                itemBuilder: (context, index) {
                  Uri uri = Uri.parse(temp[index]['pdfLink']);
                  return TextButton(
                      onPressed: () => launchUrl(uri),
                      child: Text(
                        temp[index]['headline'],
                        style: TextStyle(color: Colors.black),
                      ));
                },
              ),
            ),

            Container(
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HomePageButtton(
                      menuimage: "assets/images/Rupee (1).png",
                      func: () => (
                            launchUrlString(
                                "https://agmarknet.gov.in/PriceAndArrivals/DatewiseCommodityReport.aspx"),
                          )),
                  HomePageButtton(
                      menuimage: "assets/images/home.png",
                      func: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(
                                      number: widget.number, role: widget.role),
                                ))
                          }),
                  HomePageButtton(
                      menuimage: "assets/images/Complaint.png",
                      func: () => {
                            if (widget.role != 'officer')
                              {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterComplaint(
                                            number: widget.number,
                                            role: widget.role)))
                              }
                            else
                              {
                                print('hi'),
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ComplaintRecieved()))
                              }
                          }),
                ],
              ),
            )
          ],
        )
      ],
    ));
  }
}
