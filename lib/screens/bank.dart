//import 'package:agroconnect_day1/widget/button.dart';
//import 'package:agroconnect_day1/widget/button2.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

//import '../widget/text_field.dart';

class Bank extends StatelessWidget {
  const Bank({super.key});

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
            margin: const EdgeInsets.only(
                top: 100, bottom: 75, left: 25, right: 25),
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
                        opacity: .5,
                        child: Image.asset(
                          'assets/images/bank.png',
                        )),
                  ),
                ),
                Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Column(children: [
                          const Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              "Agricultural Loan Details of Various Banks",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 70,
                            height: MediaQuery.of(context).size.height - 250,
                            child: ListView(
                              children: [
                                Text(
                                  "Kerala state cooperative agriculture and rural development bank",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.red),
                                ),
                                SizedBox(height: 30),
                                Text(
                                  "       The Bank is on steady profit from its inception and distributes credit at an average of 2500 to 2800 Crore Rupees every year. The main fund resource of the Bank is NABARD refinance. From 2012, Bank started accepting deposit from members and as on 31.3.22, the deposit outstanding is Rs.396.14 Cr.The paid up share capital of the Bank is Rs.229 Cr and investments is Rs.563 Cr.The loan outstanding is Rs.8035 Cr and Net Worth is Rs.745 Cr. The Working Capital is Rs.6950 Cr and current year profit is Rs.298.29 Cr. The yardstick of performance of any Banking Institution is CRAR (Capital to Risk Weighted Asset Ratio) and for KSCARDB it is 11.10.  The average profit of the Bank for the last 5 years Rs. 27.53 Cr.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "       The loan schemes of the Bank are elaborate in different category such as Farm, Non-Farm, Housing and Short Term and altogether there are 23 product lines. The loan schemes are designed in such a way that it provides credit support to almost all needs of a common farmer in his life journey. It starts in farm activities, helping in non-farm activities, agricultural equipment’s purchase, vehicle, and housing and even to educational needs of children and for purchase of consumer goods. It also helps him in marriage assistance, gold pledge, and personal loan and even to pilgrimage loan. With the 23 products, Bank completes all the life needs of poor farmers in Kerala.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "For more details : ",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      launchUrlString(
                                          "https://keralalandbank.in/");
                                    },
                                    child: const Text(
                                        "https://keralalandbank.in/")),
                                SizedBox(height: 30),
                                Text(
                                  "Kerala Gramin Bank",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.red),
                                ),
                                SizedBox(height: 30),
                                  Text(
                                  "       The agricultural loans offered by Kerala Gramin Bank can be classified into Krishi Card, term loans for agriculture, loans for rubber plantation development, loans for rural marketing and setting up agri-business centres and purchasing land for agricultural use.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "       The Krishi card loan is designed to meet the short term financial needs such as money required for growing short duration crops or to meet expenses of maintaining farming equipment, fodder and veterinary expenses for farm animals and annual expenses of maintain fences, irrigation equipment and soil conservation structures.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "       The term loans for agriculture are designed to meet all the expenses incurred in any form of agriculture and its activities. Agriculture covered under this loan range from plantation to coconut to sericulture, Pisciculture irrigation systems and any other cost from the resulting activities.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "Eligibility",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "       For the Krishi Card loan, the farmer needs to be an owner and cultivator. For agriculture loans to purchase land, the borrowers need to be small or marginal farmers who would own around 5 acres of non-irrigated land at the maximum or own 2.5 acres of irrigated land including. While considering an application for such a loan, the farmer is required to submit the details of the project proposal. For setting up an agri-business centre, the borrower should be a graduate in the agricultural activity be it Pisciculture or sericulture and rural marketing outlet loans can be availed by registered institutions, individuals or an association of producers.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "Features",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                 SizedBox(height: 20),
                                Text(
                                  "       The interest rates for the agricultural short term loan is 12% p.a. if the amount availed is Rs 3 lakh or below and is 13% p.a. if the amount availed is above Rs 3 Lakh. The agricultural term loans charge an interest rate of 13% p.a. regardless of the amount taken.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "       The rural marketing outlet loan provides a maximum loan amount of up to 25 Lakhs with a margin of 25% of the project outlay. The repayment tenures vary from 3 years to 10 years and has an initial moratorium period ranging from 12 months to 18 months.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                  SizedBox(height: 20),
                                Text(
                                  "       The loans for purchase of agricultural land has a margin which is minimum 20% of the project cost. This loan requires the borrower to put the land purchased down as security. When the purchased land is mortgaged in favour of the bank, it acts as security. Along with mortgaging the purchased land, collateral security such as land property whose value is equal to that of the loan amount is also accepted. Borrowers can also pledge an LIC policy and national savings scheme policy whose surrender value is equal to the value of the loan amount.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "       The repayment period for this loan ranges from 7 to 10 years with instalments being yearly or half yearly and has a maximum moratorium period not exceeding 24 months.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 20),
                                 Text(
                                  "For more details : ",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      launchUrlString(
                                          "https://keralagbank.com/loan-interest-rates");
                                    },
                                    child: const Text(
                                        "https://keralagbank.com/loan-interest-rates")),
                                        SizedBox(height: 30),
                                Text(
                                  "NABARD",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.red),
                                ),
                                   SizedBox(height: 30),
                                  Text(
                                  "       National Bank for Agriculture and Rural Development (NABARD) offers financing solutions with interest rates starting from 4.5% p.a. They offer short- and long-term refinancing along with direct lending. The tenure of the refinancing can range from 18 months to more than 5 years.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                 SizedBox(height: 20),
                                Text("        The interest rates for short term financial assistance is 4.5%.The interest rates for long term financial assistance varies between 8.35-8.50%",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 20),
                                 Text(
                                  "For more details : ",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      launchUrlString(
                                          "https://www.nabard.org/");
                                    },
                                    child: const Text(
                                        "https://www.nabard.org/")),
                                        SizedBox(height: 30),
                                Text(
                                  "State Bank Of India",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.red),
                                ),
                                SizedBox(height: 30),
                                Text(
                                  "Crop Loan",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text("        This loan covers the expenses related to crop production, post-harvest activities, contingencies, etc. Borrowers are provided a Kisan Credit Card, a type of electronic Rupay Card, using which they can withdraw money from ATMs with ease.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                  SizedBox(height: 20),
                                Text("        The interest rate is fixed at 7% per annum.The payemnt is fixed and is based on harvesting period of crops",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  " Gold Loan",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text("        Individuals can get loans for agricultural purposes by pledging gold ornaments. These loans have attractive interest rates . The two types of gold loans available to farmers are the Agri Gold Loan for Crop Production and Multi Purpose Gold Loan",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text("        The interest upto 3 lakhs is7 % and above 7 lakhs is 9.95% per annum.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                 SizedBox(height: 20),
                                 Text(
                                  "For more details : ",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      launchUrlString(
                                          "https://sbi.co.in/web/agri-rural/agriculture-banking/crop-loan");
                                    },
                                    child: const Text(
                                        "https://sbi.co.in/web/agri-rural/agriculture-banking/crop-loan")),





                              ],
                            ),
                          )
                        ]))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
