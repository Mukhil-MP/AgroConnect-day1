//import 'package:agroconnect_day1/widget/button.dart';
//import 'package:agroconnect_day1/widget/button2.dart';
import 'package:agroconnect_day1/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:agroconnect_day1/widget/button.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

//import '../widget/text_field.dart';

class Otp extends StatelessWidget {
  const Otp({super.key});

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
              Container(
                // padding: const EdgeInsets.only(left: 21, right: 21),
                margin: const EdgeInsets.only(top: 120, left: 50),
                height: 100,
                width: 100,
                child: Image.asset("assets/images/otp.png"),
              ),
              Container(
                margin: const EdgeInsets.only(top: 35),
                child: const Text(
                  " OTP Verification",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text(
                  "we will send you a one time Password on",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: const Text(
                  "       your mobile number       ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                height: 40,
                child: OtpTextField(
                  borderRadius: BorderRadius.circular(100),
                  fillColor: Colors.white,
                  decoration: InputDecoration(fillColor: Colors.black),
                  numberOfFields: 4,
                  borderColor: Color.fromARGB(255, 255, 255, 255),
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Verification Code"),
                            content: Text('Code entered is $verificationCode'),
                          );
                        });
                  }, // end onSubmit
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 30,
                ),
                child: Text(
                  "Haven't recieved the verification code?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Resend",
                    style: TextStyle(fontSize: 15, color: Colors.red),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: CustomButton(text: "Verify",func: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                  }))
            ],
          ),
        ],
      ),
    );
  }
}
