import 'package:agroconnect_day1/screens/farmer_menu.dart';
import 'package:agroconnect_day1/screens/wa_menu.dart';
import 'package:agroconnect_day1/widget/button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../widget/text_field.dart';
import 'home_page.dart';

class ChangePassword extends StatelessWidget {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  ChangePassword({super.key, required this.number, required this.role});
  String number;
  String role;
  final dio = Dio();
  changepass(context, number, old_password, new_password) async {
    print(number);
    print(old_password);
    print(new_password);
    Response response = await dio
        .patch('https://argo-backend.onrender.com/api/v1/user/edit', data: {
      "mobileNumber": number,
      "oldPassword": old_password,
      "newPassword": new_password
    });
    print("your response" + response.data.toString());

    // var userType = response.data['user']['role'].toString();
    //print(userType);
    if (response.data['success']) {
      if (role == 'farmer') {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomePage(number: number, role: role);
        }));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomePage(number: number, role: role);
        }));
      }
    } else {
      if (role == 'farmer') {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return FarmerMenu(number: number, role: role);
        }));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return WardOffiMenu(number: number, role: role);
        }));
      }
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
                margin: const EdgeInsets.only(top: 205),
                child: CustomTextField(
                  obscureText: true,
                  controller: controller1,
                  labeltext: "Enter Old Password",
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 35),
                child: CustomTextField(
                  obscureText: false,
                  controller: controller2,
                  labeltext: "Enter New Password",
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: CustomButton(
                    text: "Submit",
                    func: () async => {
                      changepass(context, number, controller1.text.toString(),
                          controller2.text.toString())
                    },
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
