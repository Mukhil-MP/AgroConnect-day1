import 'package:agroconnect_day1/screens/create_password.dart';
import 'package:agroconnect_day1/screens/id_verification.dart';
import 'package:agroconnect_day1/widget/button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../widget/text_field.dart';

class EnterDetails extends StatefulWidget {
  String roles = '';
  

  EnterDetails({super.key, required this.roles});

  @override
  State<EnterDetails> createState() => _EnterDetailsState();
}

class _EnterDetailsState extends State<EnterDetails> {
  final dio = Dio();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  enterdetails(context, name, number, districtname, talukname, blockname,
      kbname, wardname) async {
    Response response = await dio
        .post('https://argo-backend.onrender.com/api/v1/user/create', data: {
      "name": name,
      "mobileNumber": number,
      "district": districtname,
      "taluk": talukname,
      "block": blockname,
      "kb": kbname,
      "wardno": wardname,
      "role": widget.roles
    });
    print("your response" + response.data.toString());
    if (response.data['success']) {
      if (widget.roles == 'officer') {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => IdVerification(number: number,role :widget.roles),
            ));
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AuthScreen(number: number,role: widget.roles),
            ));
      }
    } else {}
  }

  String districtname = '';
  String talukname = '';
  String blockname = '';
  String kbname = '';
  String wardname = '';
  List district = [
    {"id": 1, "name": "Thiruvanandhapuram"},
    {"id": 2, "name": "Kollam"},
    {"id": 3, "name": "Pathanamthita"},
    {"id": 4, "name": "Alappuzha"},
    {"id": 5, "name": "Kottayam"},
    {"id": 6, "name": "Idukki"},
    {"id": 7, "name": "Ernakulam"},
    {"id": 8, "name": "Thrissur"},
    {"id": 9, "name": "Palakkad"},
    {"id": 10, "name": "Malappuram"},
    {"id": 11, "name": "Kozhikode"},
    {"id": 12, "name": "Wayanad"},
    {"id": 13, "name": "Kannur"},
    {"id": 14, "name": "Kasargod"},
  ];
  List talukMaster = [
    {"id": 1, "name": "Chavakkad", "parentdistrictID": 8},
    {"id": 2, "name": "Kodungallur", "parentdistrictID": 8},
    {"id": 3, "name": "Mukundapuram", "parentdistrictID": 8},
    {"id": 4, "name": "Thalappally", "parentdistrictID": 8},
    {"id": 5, "name": "Thrissur", "parentdistrictID": 8},
    {"id": 6, "name": "Chalakkudy", "parentdistrictID": 8},
    {"id": 7, "name": "Kunnamkulam", "parentdistrictID": 8},
  ];
  List<dynamic> taluk = [];

  List blockMaster = [
    {"id": 1, "name": "Anthikad", "parentdistrictID": 8},
    {"id": 2, "name": "Chalakkudy", "parentdistrictID": 8},
    {"id": 3, "name": "Chavakkad", "parentdistrictID": 8},
    {"id": 4, "name": "Cherpu", "parentdistrictID": 8},
    {"id": 5, "name": "Chowannur", "parentdistrictID": 8},
    {"id": 6, "name": "Irinjalakuda", "parentdistrictID": 8},
    {"id": 7, "name": "Kodakara", "parentdistrictID": 8},
    {"id": 8, "name": "Mala", "parentdistrictID": 8},
    {"id": 9, "name": "Mathilakam", "parentdistrictID": 8},
    {"id": 10, "name": "Mullassery", "parentdistrictID": 8},
    {"id": 11, "name": "Ollukkara", "parentdistrictID": 8},
    {"id": 12, "name": "Pazhayannur", "parentdistrictID": 8},
    {"id": 13, "name": "Puzhakkal", "parentdistrictID": 8},
    {"id": 14, "name": "Thalikulam", "parentdistrictID": 8},
    {"id": 15, "name": "Vellangallur", "parentdistrictID": 8},
    {"id": 16, "name": "Wadakkanchery", "parentdistrictID": 8},
  ];
  List<dynamic> block = [];
  List krishiBhavanMaster = [
    {"id": 1, "name": "KB Aloor", "parentblockID": 8},
    {"id": 2, "name": "KB Annamanada", "parentblockID": 8},
    {"id": 3, "name": "KB Kodungaloor Municipality", "parentblockID": 8},
    {"id": 4, "name": "KB Kuzhur", "parentblockID": 8},
    {"id": 5, "name": "KB Mala", "parentblockID": 8},
    {"id": 6, "name": "KB Methala", "parentblockID": 8},
    {"id": 7, "name": "KB poyya", "parentblockID": 8},
  ];
  List<dynamic> krishiBhavan = [];
  List wardMaster = [
    {"id": 1, "name": "1", "parentkbID": 3},
    {"id": 2, "name": "2", "parentkbID": 3},
    {"id": 3, "name": "3", "parentkbID": 3},
    {"id": 4, "name": "4", "parentkbID": 3},
    {"id": 5, "name": "5", "parentkbID": 3},
    {"id": 6, "name": "6", "parentkbID": 3},
    {"id": 7, "name": "7", "parentkbID": 3},
    {"id": 8, "name": "8", "parentkbID": 3},
    {"id": 9, "name": "9", "parentkbID": 3},
    {"id": 10, "name": "10", "parentkbID": 3},
    {"id": 11, "name": "11", "parentkbID": 3},
    {"id": 12, "name": "12", "parentkbID": 3},
    {"id": 13, "name": "13", "parentkbID": 3},
    {"id": 14, "name": "14", "parentkbID": 3},
    {"id": 15, "name": "15", "parentkbID": 3},
    {"id": 16, "name": "16", "parentkbID": 3},
    {"id": 17, "name": "17", "parentkbID": 3},
    {"id": 18, "name": "18", "parentkbID": 3},
    {"id": 19, "name": "19", "parentkbID": 3},
    {"id": 20, "name": "20", "parentkbID": 3},
    {"id": 21, "name": "21", "parentkbID": 3},
    {"id": 22, "name": "22", "parentkbID": 3},
    {"id": 23, "name": "23", "parentkbID": 3},
    {"id": 24, "name": "24", "parentkbID": 3},
    {"id": 25, "name": "25", "parentkbID": 3},
    {"id": 26, "name": "26", "parentkbID": 3},
    {"id": 27, "name": "27", "parentkbID": 3},
    {"id": 28, "name": "28", "parentkbID": 3},
    {"id": 29, "name": "29", "parentkbID": 3},
    {"id": 30, "name": "30", "parentkbID": 3},
    {"id": 31, "name": "31", "parentkbID": 3},
    {"id": 32, "name": "32", "parentkbID": 3},
    {"id": 33, "name": "33", "parentkbID": 3},
    {"id": 34, "name": "34", "parentkbID": 3},
    {"id": 35, "name": "35", "parentkbID": 3},
    {"id": 36, "name": "36", "parentkbID": 3},
    {"id": 37, "name": "37", "parentkbID": 3},
    {"id": 38, "name": "38", "parentkbID": 3},
    {"id": 39, "name": "39", "parentkbID": 3},
    {"id": 40, "name": "40", "parentkbID": 3},
    {"id": 41, "name": "41", "parentkbID": 3},
    {"id": 42, "name": "42", "parentkbID": 3},
    {"id": 43, "name": "43", "parentkbID": 3},
    {"id": 44, "name": "44", "parentkbID": 3},
  ];
  List<dynamic> ward = [];
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
            children: [
              SizedBox(
                height: 130,
              ),
              Center(
                  child: Text("Enter Your Details",
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold))),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // textfield
              Container(
                margin: const EdgeInsets.only(top: 200),
                child: CustomTextField(
                  obscureText: false,
                  controller: controller1,
                  labeltext: "Name",
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 17),
                child: CustomTextField(
                  obscureText: false,
                  controller: controller2,
                  labeltext: "Phone No",
                ),
              ),
              FormHelper.dropDownWidget(
                  context, "District", this.districtID, this.district,
                  (onChanged) {
                setState(() {
                  this.districtname =
                      district[int.parse(onChanged) - 1]['name'];
                  print(districtname);
                  this.districtID = onChanged;
                });

                print("Selected district: $districtID");

                this.taluk = this
                    .talukMaster
                    .where(
                      (stateItem) =>
                          stateItem["parentdistrictID"].toString() ==
                          districtID.toString(),
                    )
                    .toList();
                this.block = this
                    .blockMaster
                    .where(
                      (stateItem) =>
                          stateItem["parentdistrictID"].toString() ==
                          districtID.toString(),
                    )
                    .toList();

                this.blockID = null;
                this.talukID = null;
              }, (onValidate) {
                if (onValidate == null) {
                  return 'Please select district';
                }
                return null;
              }),
              FormHelper.dropDownWidget(context, "Taluk", talukID, taluk,
                  (onChanged) {
                this.talukname = taluk[int.parse(onChanged) - 1]['name'];
                print(talukname);
                talukID = onChanged;
                print("Selected taluk: $talukID");
              }, (onValidate) {
                if (onValidate == null) {
                  return 'Please select district';
                }
                return null;
              }),
              FormHelper.dropDownWidget(context, "Block", blockID, block,
                  (onChanged) {
                setState(() {
                  this.blockname = block[int.parse(onChanged) - 1]['name'];
                  print(blockname);
                  blockID = onChanged;
                });

                print("Selected block: $blockID");
                this.krishiBhavan = this
                    .krishiBhavanMaster
                    .where((stateItem) =>
                        stateItem["parentblockID"].toString() ==
                        blockID.toString())
                    .toList();

                this.kbID = null;
              }, (onValidate) {
                if (onValidate == null) {
                  return 'Please select block';
                }
                return null;
              }),
              FormHelper.dropDownWidget(
                  context, "Krishi Bhavan", kbID, krishiBhavan, (onChanged) {
                setState(() {
                  this.kbname = krishiBhavan[int.parse(onChanged) - 1]['name'];
                  print(kbname);
                  kbID = onChanged;
                });

                print("Selected KB: $kbID");
                this.ward = this
                    .wardMaster
                    .where((stateItem) =>
                        stateItem["parentkbID"].toString() ==
                        onChanged.toString())
                    .toList();
                this.wardID = null;
              }, (onValidate) {
                if (onValidate == null) {
                  return 'Please select kb';
                }
                return null;
              }),
              FormHelper.dropDownWidget(context, "Ward", wardID, ward,
                  (onChanged) {
                this.wardname = ward[int.parse(onChanged) - 1]['name'];
                print(wardname);
                wardID = onChanged;
                print("Selected district: $wardID");
              }, (onValidate) {
                if (onValidate == null) {
                  return 'Please select ward';
                }
                return null;
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
                  margin: const EdgeInsets.only(top: 100, left: 150),
                  child: CustomButton(
                      text: "Submit",
                      func: () => {
                            enterdetails(
                                context,
                                controller1.text,
                                controller2.text,
                                districtname,
                                talukname,
                                blockname,
                                kbname,
                                wardname)
                          })),
            ],
          ),
        ],
      ),
    );
  }
}
