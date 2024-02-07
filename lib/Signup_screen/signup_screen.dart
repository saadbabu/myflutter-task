import 'package:flutter/material.dart';
import 'package:myflutter_task/home_screen/home_scren.dart';
import 'package:myflutter_task/Signup_screen/auth.dart'
    show registerUserWithEmail;

class Mysignup extends StatefulWidget {
  const Mysignup({super.key});

  @override
  State<Mysignup> createState() => _MysignupState();
}

class _MysignupState extends State<Mysignup> {
  bool ispasswordvisible = true;
  TextEditingController _namecontroller = new TextEditingController();
  TextEditingController _passcontroller = new TextEditingController();
  Future<void> registerUser() async {
    final String email = ModalRoute.of(context)!.settings.arguments as String;
    final result = await registerUserWithEmail(email, _passcontroller.text);
    if (result != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Myhomescreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)!.settings.arguments as String;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset("assets/back.jpeg"),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.28,
                    left: MediaQuery.of(context).size.width * 0.05),
                child: const Text(
                  "Sign up",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.35,
                    left: MediaQuery.of(context).size.width * 0.02),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.96,
                  height: MediaQuery.of(context).size.height * 0.45,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(48, 48, 48, 0.698),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height * 0.02,
                      top: MediaQuery.of(context).size.height * 0.03,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Looks Like you don't have an account.",
                          style: TextStyle(color: Colors.white),
                        ),
                        const Text(
                          "Let's create an account for",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "$email",
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.85,
                            height: MediaQuery.of(context).size.height * 0.065,
                            child: TextFormField(
                              controller: _namecontroller,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'User Name ',
                                hintStyle: const TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.height * 0.065,
                          child: TextFormField(
                            controller: _passcontroller,
                            obscureText: ispasswordvisible,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Password',
                              hintStyle: const TextStyle(color: Colors.grey),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  ispasswordvisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    ispasswordvisible = !ispasswordvisible;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Text(
                          "By selecting agree and continue below,",
                          style: TextStyle(color: Colors.white),
                        ),
                        const Row(
                          children: [
                            Text(
                              "I agree to ",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Terms of Service and Privacy Policy",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 134, 243, 134)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.height * 0.065,
                          child: ElevatedButton(
                            onPressed: () {
                              registerUser();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Myhomescreen()));
                            },
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 134, 243, 134)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)))),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
