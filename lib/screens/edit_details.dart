import 'package:agroconnect_day1/widget/button.dart';
import 'package:flutter/material.dart';

import '../widget/text_field.dart';

class EditDetails extends StatelessWidget {
  const EditDetails({super.key});

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
        const Column(
          children: const [SizedBox(
          height: 130,
          ),
          Center(
            child:Text(
              "Enter Your Details",
              style:TextStyle(fontSize: 30,
              fontWeight: FontWeight.bold)
            )
          )
          ,],
         ) ,
          
          
          
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             
        
              Container(
                margin: const EdgeInsets.only(top: 200),
                child: CustomTextField(
                  labeltext: "Phone No",
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
                  margin: const EdgeInsets.only(top: 500 ,left: 150),
                  child: CustomButton(text: "Submit",func: (){},)),
            ],
          ),
        ],
      ),
    );
  }
}
