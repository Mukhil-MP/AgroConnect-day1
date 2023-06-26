import 'package:flutter/material.dart';

class FAQ extends StatelessWidget {
  const FAQ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff05FF00), // Customize the app bar color
        centerTitle: true,
        title: const Text(
          'FAQ',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0), // Customize the text color
            fontWeight: FontWeight.bold, // Make the text bold
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "1.What is AgroConnect?",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "AgroConnect is a mobile application designed to assist farmers with various features to enhance their agricultural activities and provide valuable information.",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            Text(
              "2. How will AgroConnect keep me updated on agricultural activities?",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "AgroConnect sends notifications and news related to agricultural activities, providing real-time updates on government policies, market trends, and other relevant information.",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            Text(
              "3.Can I access weather reports through AgroConnect?",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Yes, AgroConnect provides accurate and localized weather reports. You can stay informed about changing weather conditions, helping you make better decisions for irrigation, planting, and harvesting.",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            Text(
              "4.Will AgroConnect help me stay updated on daily product rates?",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Absolutely! AgroConnect offers information on daily product rates, keeping you informed about the current market prices for crops, livestock, and other farm products.",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            Text(
              "5.Where can I find details about available loans?",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "AgroConnect provides comprehensive information about available loans and financing options specifically tailored for farmers. You can access details about government schemes, agricultural loans, interest rates, eligibility criteria, and the application process.",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            Text(
              "6.How can I register a complaint through AgroConnect?",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "AgroConnect offers a dedicated complaint registration feature. You can easily register complaints related to agricultural issues, such as crop diseases or pest infestations. Our team will review and address your complaints promptly.",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            Text(
              "7.Is there a support team I can reach out to for assistance?",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Yes, AgroConnect has a support team available to assist you with any queries or issues you may encounter while using the app. Feel free to reach out to our support team for prompt assistance.",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
