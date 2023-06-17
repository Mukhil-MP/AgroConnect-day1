//import 'package:agroconnect_day1/widget/button.dart';
import 'package:agroconnect_day1/widget/button4.dart';
import 'package:flutter/material.dart';

//import '../widget/text_field.dart';

class WardOffiMenu extends StatelessWidget {
  const WardOffiMenu({super.key});

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
                  margin: const EdgeInsets.only(top: 130),
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(54),
                    boxShadow: [BoxShadow(blurRadius: 10)],
                  ),
                  child: Text('db data')),

              Container(
                margin: const EdgeInsets.only(top: 60),
                child: CustomButton4(
                    text: "Edit Personal Details",
                    imagelock: "assets/images/profile.png"),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: CustomButton4(
                    text: "Application Form",
                    imagelock: "assets/images/form.png"),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: CustomButton4(
                    text: "Notify Farmers",
                    imagelock: "assets/images/notify.png"),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: CustomButton4(
                    text: "Change Password",
                    imagelock: "assets/images/password.png"),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: CustomButton4(
                    text: "About/FAQ", imagelock: "assets/images/faq.png"),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: CustomButton4(
                    text: "Logout", imagelock: "assets/images/logout.png"),
              )
            ],
          ),
        ],
      ),
    );
  }
}