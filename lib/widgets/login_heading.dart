import 'package:flutter/material.dart';

class Loginhead extends StatefulWidget {
  const Loginhead({super.key});

  @override
  State<Loginhead> createState() => _LoginheadState();
}

class _LoginheadState extends State<Loginhead> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage("assets/saad.jpeg")))),
        SizedBox(
          width: 10.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Muhammad Saad",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "m.saad543210@gmail.com",
              style: TextStyle(color: Colors.white),
            )
          ],
        )
      ],
    );
  }
}
