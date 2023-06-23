import 'package:agroconnect_day1/screens/home_page.dart';
import 'package:agroconnect_day1/screens/user_selection.dart';
import 'package:agroconnect_day1/widget/button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../widget/text_field.dart';

class LoginSign extends StatelessWidget {
  final dio = Dio();
  late Response response;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  LoginSign({super.key});

  _requestLogin(context, phone, password) async {
    print(phone);
    print(password);
    response = await dio.post('https://agro-7bpt.onrender.com/login',
        data: {"phone": phone, "password": password});
    print("your response" + response.data.toString());

    var userType = response.data.toString();

    if (response.data['success']) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomePage();
      }));
    }

    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const HomePage(),
    //     ));
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
                margin: const EdgeInsets.only(top: 200),
                child: CustomTextField(
                  controller: controller1,
                  labeltext: "Enter your ID",
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 17),
                child: CustomTextField(
                  controller: controller2,
                  labeltext: "Enter Your Password",
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 150),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "forgot password ?",
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                ),
              ),

              // Container(
              //   margin: const EdgeInsets.only(top: 227),
              //   padding:  const EdgeInsets.only(left: 48, right: 48),
              //   child: const TextField(
              //     decoration: InputDecoration(
              //       labelText: "Enter Your ID",
              //       labelStyle: TextStyle(fontSize: 24),
              //       floatingLabelBehavior: FloatingLabelBehavior.never,
              //     ),
              //   ),
              // ),

              // button

              Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: CustomButton(
                    text: "Log In",
                    func: () async => {
                      _requestLogin(context, controller1.text.toString(),
                          controller2.text.toString())
                    },
                  )),
              Container(
                margin: const EdgeInsets.only(top: 14),
                child: Text(
                  "OR",
                  style: TextStyle(color: Colors.red, fontSize: 24),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 14),
                  child: CustomButton(
                    text: "Sign Up",
                    func: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UserSelection(),
                          ))
                    },
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
