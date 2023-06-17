import 'package:agroconnect_day1/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../widget/text_field.dart';

class EnterDetails extends StatefulWidget {
  const EnterDetails({super.key});

  @override
  State<EnterDetails> createState() => _EnterDetailsState();
}

class _EnterDetailsState extends State<EnterDetails> {
List district = [{"id":1,"name":"Kasargod"},
                {"id":2,"name":"Kannoor"},
                {"id":3,"name":"Thrissur"},];
List talukMaster =   [{"id":1,"name":"Kodungaloor","parentdistrictID":3},
                {"id":2,"name":"taluk 2" ,"parentdistrictID":3},
                {"id":3,"name":"taluk 3","parentdistrictID":3},];
List<dynamic> taluk=[];

List blockMaster =   [{"id":1,"name":"Mala","parenttalukID":1},
                {"id":2,"name":"block 2","parenttalukID":1},
                {"id":3,"name":"block 3","parenttalukID":1},];
List<dynamic> block=[];
List krishiBhavanMaster =   [{"id":1,"name":"KB Kodungaloor Municipality","parentblockID":1},
                {"id":2,"name":"KB 2" ,"parentblockID":1},
                {"id":3,"name":"KB 3","parentblockID":1},];
List<dynamic> krishiBhavan=[];
List wardMaster =    [{"id":1,"name":"1", "parentkbID":1},
                {"id":2,"name":"2" ,"parentkbID":1},
                {"id":3,"name":"3", "parentkbID":1},
                {"id":4,"name":"4", "parentkbID":1},
                {"id":5,"name":"5", "parentkbID":1},
                {"id":6,"name":"6", "parentkbID":1},];
List<dynamic> ward=[];
              String? districtID;
              String? talukID;
              String? blockID;
              String? kbID;
              String? wardID;


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
          children:  [SizedBox(
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
              // textfield
              Container(
                margin: const EdgeInsets.only(top: 200),
                child: const CustomTextField(
                  labeltext: "Name",
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 17),
                child: const CustomTextField(
                  labeltext: "Phone No",
                ),
              ),
              FormHelper.dropDownWidget(context, "District", this.districtID, this.district, (onChanged){districtID = onChanged;
              print("Selected district: $districtID");

              
                this.taluk = this.talukMaster.where((stateItem)=>stateItem["parentdistrictID"].toString() == onChanged.toString(),).toList();
                this.talukID= null;
              
              
              }, (onValidate){
                if (onValidate==null) {
                  return 'Please select district';
                  
                } return null;
              }),
              FormHelper.dropDownWidget(context, "Taluk", talukID, taluk, (onChanged){talukID = onChanged;
              print("Selected taluk: $talukID");
              block = blockMaster.where((stateItem)=>stateItem["parenttalukID"].toString()==onChanged.toString()).toList();
              }, (onValidate){
                if (onValidate==null) {
                  return 'Please select taluk';
                  
                } return null;
              }),
              FormHelper.dropDownWidget(context, "Block", blockID, block, (onChanged){blockID = onChanged;
              print("Selected block: $blockID");
              krishiBhavan = krishiBhavanMaster.where((stateItem)=>stateItem["parentblockID"].toString()==onChanged.toString()).toList();}, (onValidate){
                if (onValidate==null) {
                  return 'Please select block';
                  
                } return null;
              }),
              FormHelper.dropDownWidget(context, "Krishi Bhavan", kbID, krishiBhavan, (onChanged){kbID = onChanged;
              print("Selected KB: $kbID");
              ward = wardMaster.where((stateItem)=>stateItem["parentkbID"].toString()==onChanged.toString()).toList();}, (onValidate){
                if (onValidate==null) {
                  return 'Please select kb';
                  
                } return null;
              }),
              FormHelper.dropDownWidget(context, "Ward", wardID, ward, (onChanged){wardID = onChanged;
              print("Selected district: $wardID");}, (onValidate){
                if (onValidate==null) {
                  return 'Please select ward';
                  
                } return null;
              }),
              

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
                  margin: const EdgeInsets.only(top: 100 ,left: 150),
                  child: CustomButton(text: "Submit",func: (){},)),
            ],
          ),
        ],
      ),
    );
  }
}
