import 'package:flutter/material.dart';

class Facebookwidget extends StatelessWidget {
  const Facebookwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
          color: Color.fromARGB(175, 255, 253, 253),
          borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        children: [
          Image.asset("assets/fb.png"),
          Text(
            "Continue with Facebook",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          )
        ],
      ),
    );
  }
}
