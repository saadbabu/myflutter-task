import 'package:flutter/material.dart';

class Applewidget extends StatelessWidget {
  const Applewidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.06,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            color: const Color.fromARGB(175, 255, 253, 253),
            borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.035),
          child: Row(
            children: [
              Image.asset("assets/apple.png"),
              Expanded(
                child: Text(
                  "Continue with Apple",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ));
  }
}
