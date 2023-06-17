import 'package:flutter/material.dart';

class CustomButton4 extends StatelessWidget {
  final String text;
  final String imagelock;

  const CustomButton4({
    Key? key,
    required this.text,
    required this.imagelock,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: .9,
      child: Container(
        height: 60,
        width: 500,
        decoration: BoxDecoration(
            color: Color(0x77ffffff), boxShadow: [BoxShadow(blurRadius: 10)]),
        child: ElevatedButton(
            onPressed: () => {},
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              //shadowColor: Colors.transparent,
            ),
            //backgroundColor: Colors.white10.withOpacity(1.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 15),
                    height: 45,
                    width: 45,
                    child: Image.asset(imagelock)),
                Container(
                  margin: EdgeInsets.only(left: 40),
                  child: Text(
                    text,
                    style: const TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}