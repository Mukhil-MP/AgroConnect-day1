//import 'package:agroconnect_day1/widget/button.dart';
import 'package:agroconnect_day1/screens/Faq.dart';
import 'package:agroconnect_day1/screens/edit_details.dart';
import 'package:agroconnect_day1/screens/enter_details.dart';
import 'package:agroconnect_day1/screens/login_sigin.dart';
import 'package:agroconnect_day1/widget/button4.dart';
import 'package:flutter/material.dart';

//import '../widget/text_field.dart';

class FarmerMenu extends StatelessWidget {
  String number;
  String role;
   FarmerMenu({super.key,required this.number,required this.role});
  
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
                alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 130),
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(54),
                    boxShadow: [BoxShadow(blurRadius: 10)],
                  ),
                  child:
                   Text(number,style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),

              Container(
                margin: const EdgeInsets.only(top: 60),
                child: CustomButton4(
                  text: "Edit Personal Details",
                  func: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  EditDetails(number:number,role: role,)
                        ))
                  },
                  imagelock: "assets/images/profile.png",
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: CustomButton4(
                    text: "Application Form",
                    func: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  FarmerMenu(number: number,role: role),
                              ))
                        },
                    imagelock: "assets/images/form.png"),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: CustomButton4(
                    text: "Change Password",
                    func: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  FarmerMenu(number: number,role: role),
                              ))
                        },
                    imagelock: "assets/images/password.png"),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: CustomButton4(
                    text: "About/FAQ",
                    func: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FAQ(),
                              ))
                        },
                    imagelock: "assets/images/faq.png"),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: CustomButton4(
                    text: "Logout",
                    func: () => {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginSign()),
                            (route) => route.isCurrent,
                          )
                        },
                    imagelock: "assets/images/logout.png"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
