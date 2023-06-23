import 'package:agroconnect_day1/screens/wa_menu.dart';
import 'package:agroconnect_day1/widget/button.dart';
import 'package:flutter/material.dart';

import '../widget/text_field.dart';

class ChangePassword extends StatelessWidget {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  ChangePassword({super.key});

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
                margin: const EdgeInsets.only(top: 205),
                child: CustomTextField(
                  controller: controller1,
                  labeltext: "Enter new Password",
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 35),
                child: CustomTextField(
                  controller: controller2,
                  labeltext: "Confirm new Password",
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: CustomButton(
                    text: "Submit",
                    func: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WardOffiMenu(),
                          ))
                    },
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
