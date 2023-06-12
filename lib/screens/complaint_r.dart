//import 'package:agroconnect_day1/widget/button.dart';
import 'package:agroconnect_day1/widget/button5.dart';
import 'package:agroconnect_day1/widget/button6.dart';
import 'package:agroconnect_day1/widget/button7.dart';
import 'package:flutter/material.dart';

import '../widget/text_field.dart';

class RegisterComplaint extends StatelessWidget {
  const RegisterComplaint({super.key});

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
                  colors: [Color.fromARGB(255, 255, 255, 255)]),
            ),
          ),
          Container(
            // padding: const EdgeInsets.only(left: 21, right: 21),
            margin: const EdgeInsets.only(top: 54, left: 17),
            height: 45,
            width: 170,
            child: Image.asset("assets/images/agroconnect_text.png"),
          ),
         
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

               Row(
                 children: [
                   Container(
                    
                      margin: const EdgeInsets.only(top: 30 ),
                      child: const CustomButton6(text: "Register")
                      
                      
                      ),
                      Container(
                
                  margin: const EdgeInsets.only(top: 30 ),
                  child: const CustomButton7(text: "History")
                  
                  
                  ),
                 ],
               ),

                  
            
              Container(
                margin: const EdgeInsets.only(top: 205),
                child: CustomTextField(
                  labeltext: "Type your complaint here",
                ),
              ),
              
             
              Container(
                
                  margin: const EdgeInsets.only(top: 150, left:150),
                  child: CustomButton5(text: "Submit")
                  
                  
                  ),
              Container(
            // padding: const EdgeInsets.only(left: 21, right: 21),
            margin: const EdgeInsets.only(top: 54, left: 17),
            height: 55,
            width: 300,
            child: Image.asset("assets/images/Add the following (Optional)_ Subject, address, phone number..png"),
          ),
                  

            ],
          ),
        ],
      ),
    );
  }
}
