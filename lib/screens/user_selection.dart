import 'package:agroconnect_day1/widget/button.dart';
import 'package:flutter/material.dart';

import '../widget/text_field.dart';

class UserSelection extends StatelessWidget {
  const UserSelection({super.key});

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
                  labeltext: "Enter your ID",
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 17),
                child: CustomTextField(
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
                  child: CustomButton(text: "Log In")),
              Container(
                margin: const EdgeInsets.only(top: 14),
                child: Text(
                  "OR",
                  style: TextStyle(color: Colors.red, fontSize: 24),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 14),
                  child: CustomButton(text: "Sign Up"))
            ],
          ),
        ],
      ),
    );
  }
}
