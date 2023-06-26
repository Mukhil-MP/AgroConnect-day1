import 'package:agroconnect_day1/screens/home_page.dart';
import 'package:agroconnect_day1/screens/login_sigin.dart';
import 'package:agroconnect_day1/screens/otp.dart';
import 'package:agroconnect_day1/screens/user_selection.dart';
import 'package:agroconnect_day1/widget/button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../widget/text_field.dart';

class PhoneVerify extends StatelessWidget {
  TextEditingController controller1 = TextEditingController();
  PhoneVerify({super.key});
  final dio = Dio();

  Future<void> verify(context, number) async {
    print('Phone verify');

    Response response = await dio.post(
        'https://argo-backend.onrender.com/api/v1/user/signup',
        data: {"mobileNumber": number});
    print("your response" + response.data.toString());
    if (response.data['success']) {
      if (response.data['isRegistered']) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return LoginSign();
        }));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Otp(otpcode: response.data['otp']);
        }));
      }
    }
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
                  colors: [Color(0xff05FF00), Color(0xff000000)]),
            ),
          ),
          Container(
            // padding: const EdgeInsets.only(left: 21, right: 21),
            margin: const EdgeInsets.only(top: 54, left: 17),
            height: 45,
            width: 170,
            child: Image.asset("assets/images/agroconnect_text.png"),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: MediaQuery.of(context).size.height,
            child: Image.asset('assets/images/pashu.png'),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // textfield
              //Container(
              //  margin: const EdgeInsets.only(top: 270),
              //child: Text('db data')),
              Container(
                margin: const EdgeInsets.only(top: 270),
                child: CustomTextField(
                  obscureText: false,
                  controller: controller1,
                  labeltext: "Enter your phone number",
                ),
              ),

              Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: CustomButton(
                      text: "Submit",
                      func: () =>
                          {verify(context, controller1.text.toString())})),
            ],
          ),
        ],
      ),
    );
  }
}
