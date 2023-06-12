//import 'package:agroconnect_day1/widget/button.dart';
//import 'package:agroconnect_day1/widget/button2.dart';
import 'package:agroconnect_day1/widget/button3.dart';
import 'package:flutter/material.dart';

//import '../widget/text_field.dart';

class laws extends StatelessWidget {
  const laws({super.key});

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
          Container(
            margin: EdgeInsets.only(top: 100, bottom: 75, left: 25, right: 25),
            height: MediaQuery.of(context).size.height - 75,
            width: MediaQuery.of(context).size.width - 50,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                ),
                Center(
                  child: Container(
                    //alignment: Alignment.center,
                    //height: MediaQuery.of(context).size.height,
                    child: Opacity(
                        opacity: 1,
                        child: Image.asset(
                          'assets/images/law.png',
                        )),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        "Acts & Rules",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: customButton3(
                                address:
                                    "https://agricoop.nic.in/en/ActsAgriMkt",
                                text: "Agricultural Marketing")),
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: customButton3(
                                address:
                                    "https://agricoop.nic.in/en/ActsNutrMan",
                                text: "Integrated Nutrient\n Management ")),
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: customButton3(
                                address:
                                    "https://agricoop.nic.in/en/ActsMechTec",
                                text: "Mechanization &\nTechnology"))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: customButton3(
                                address:
                                    "https://agricoop.nic.in/en/ActsCoopRat",
                                text: "coorperation")),
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: customButton3(
                                address:
                                    "https://agricoop.nic.in/en/ActsNatuResMan",
                                text: "Natural Resource\nManagement")),
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: customButton3(
                                address:
                                    "https://agricoop.nic.in/en/ActsOffiLan",
                                text: "Official Language"))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: customButton3(
                                address:
                                    "https://agricoop.nic.in/en/ActsCropNfsm",
                                text: "Crops & NFSM")),
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: customButton3(
                                address:
                                    "https://agricoop.nic.in/en/ActsOilsDiv",
                                text: "Oilseeds Division")),
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: customButton3(
                                address:
                                    "https://agricoop.nic.in/en/ActsDrouMan",
                                text: "Drought Management"))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: customButton3(
                                address:
                                    "https://agricoop.nic.in/en/ActsEconAdm",
                                text: "Economic\nAdministration")),
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: customButton3(
                                address:
                                    "https://agricoop.nic.in/en/ActsPlantProtection",
                                text: "Plant Protections")),
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: customButton3(
                                address:
                                    "https://agricoop.nic.in/en/ActsExteNsion",
                                text: "Extenstion"))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: customButton3(
                                address:
                                    "https://agricoop.nic.in/en/ActsPoliCy",
                                text: "Policy")),
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: customButton3(
                                address:
                                    "https://agricoop.nic.in/en/ActsFarmWels",
                                text: "Farmer Welfare")),
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: customButton3(
                                address:
                                    "https://agricoop.nic.in/en/ActsGeneAdm",
                                text: "General Administration"))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: customButton3(
                                address: "https://agricoop.nic.in/en/ActsSeedS",
                                text: "Seeds")),
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: customButton3(
                                address:
                                    "https://agricoop.nic.in/en/ActsHortCul",
                                text: "Horticulture")),
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: customButton3(
                                address:
                                    "https://agricoop.nic.in/en/ActsDigiAgr",
                                text: "Digital\nAgriculture"))
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
