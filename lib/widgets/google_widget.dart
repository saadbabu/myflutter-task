import 'package:flutter/material.dart';

class Googlewidget extends StatelessWidget {
  const Googlewidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
          color: Color.fromARGB(175, 255, 253, 253),
          borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding:
            EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.035),
        child: Row(
          children: [
            Image.asset("assets/google.png"),
            Expanded(
              child: Text(
                "Continue with Google",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}
