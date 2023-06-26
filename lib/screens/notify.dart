import 'package:agroconnect_day1/screens/wa_menu.dart';
import 'package:agroconnect_day1/widget/button7.dart';
import 'package:dio/dio.dart';
//import 'package:agroconnect_day1/widget/button6.dart';
//import 'package:agroconnect_day1/widget/button7.dart';
import 'package:flutter/material.dart';
import '../widget/text_field.dart';
import 'home_page.dart';

class Notify extends StatelessWidget {
  TextEditingController controller1 = TextEditingController();

  Notify({super.key, required this.number, required this.role});
  String number;
  String role;
  final dio = Dio();
  notify(context, number, noti) async {
    // print(number);
    // print(old_password);
    // print(new_password);
    Response response = await dio
        .post('https://argo-backend.onrender.com/api/v1/user/notify/upload', data: {
      "mobileNumber": number,
      "notification": noti,
    });
    print("your response" + response.data.toString());
    if (response.data['success']) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomePage(number: number, role: role);
      }));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return WardOffiMenu(number: number, role: role);
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff05FF00), // Customize the app bar color
        centerTitle: true,
        title: const Text(
          'Notify',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0), // Customize the text color
            fontWeight: FontWeight.bold, // Make the text bold
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 205),
                child: CustomTextField(
                  obscureText: false,
                  controller: controller1,
                  labeltext: "Type your notification here",
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 150, left: 150),
                  child: CustomButton7(
                    text: "Submit",
                    func: () async =>
                        {notify(context, number, controller1.text.toString())},
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
