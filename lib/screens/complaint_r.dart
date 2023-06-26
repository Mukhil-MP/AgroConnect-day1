//import 'package:agroconnect_day1/widget/button.dart';
import 'package:agroconnect_day1/screens/home_page.dart';
import 'package:agroconnect_day1/widget/button5.dart';
import 'package:agroconnect_day1/widget/button6.dart';
import 'package:agroconnect_day1/widget/button7.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../widget/text_field.dart';

class RegisterComplaint extends StatelessWidget {
  RegisterComplaint({super.key, required this.number, required this.role});
  final String number;
  final String role;
  final TextEditingController controller1 = TextEditingController();
  final dio = Dio();
  submitComplaint(complaint, context) async {
    Response response = await dio.post(
        'https://argo-backend.onrender.com/api/v1/user/complaint/register',
        data: {"complaint": complaint, "mobileNumber": number});
    print(response);
    if (response.data['success']) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(number: number, role: role),
          ));
    } else {}
  }

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
            // padding: const EdgeInsets.only(left: 21, right: 21),
            margin: const EdgeInsets.only(top: 54, left: 17),
            height: 45,
            width: 170,
            child: Image.asset("assets/images/agroconnect_text.png"),
          ),
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
                      margin: const EdgeInsets.only(top: 30),
                      child: CustomButton6(
                        text: "Register",
                        func: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterComplaint(
                                    number: number, role: role),
                              ));
                        },
                      )),
                  Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: CustomButton7(
                        text: "History",
                        func: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterComplaint(
                                  number: number,
                                  role: role,
                                ),
                              ));
                        },
                      )),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 205),
                child: CustomTextField(
                  labeltext: "Type your complaint here",
                  controller: controller1,
                  obscureText: false,
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 150, left: 150),
                  child: CustomButton5(
                    text: "Submit",
                    func: () {
                      submitComplaint(controller1.text.toString(), context);
                    },
                  )),
              Container(
                // padding: const EdgeInsets.only(left: 21, right: 21),
                margin: const EdgeInsets.only(top: 54, left: 17),
                height: 55,
                width: 300,
                child: Image.asset(
                    "assets/images/Add the following (Optional)_ Subject, address, phone number..png"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
