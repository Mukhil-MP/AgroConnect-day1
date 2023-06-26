import 'package:agroconnect_day1/screens/home_page.dart';
import 'package:agroconnect_day1/widget/button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../widget/text_field.dart';

class AuthScreen extends StatelessWidget {
  TextEditingController controller1 = TextEditingController();
  AuthScreen({super.key, required this.number,required this.role});
   String role;
  String number = '';
  final dio = Dio();

  createpass(context, number, pass) async {
    Response response = await dio.post(
        'https://argo-backend.onrender.com/api/v1/user/password',
        data: {"mobileNumber": number, "password": pass});
    print("your response" + response.data.toString());
    if (response.data['success']) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomePage(number: number,role: role);
      }));
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
              Container(
                  margin: const EdgeInsets.only(top: 270),
                  child: Text(
                    "ID :$number",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )),
              Container(
                margin: const EdgeInsets.only(top: 65),
                child: CustomTextField(
                  obscureText: false,
                  controller: controller1,
                  labeltext: "Create Password",
                ),
              ),

              Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: CustomButton(
                      text: "Submit",
                      func: () => {
                            createpass(
                                context, number, controller1.text.toString())
                          })),
            ],
          ),
        ],
      ),
    );
  }
}
