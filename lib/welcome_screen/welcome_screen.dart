import 'package:flutter/material.dart';
import 'package:myflutter_task/Signup_screen/signup_screen.dart';
import 'package:myflutter_task/login_screen/login_screen.dart';
import 'package:myflutter_task/welcome_screen/welcome_screen_provider.dart';
import 'package:myflutter_task/widgets/apple_widget.dart';
import 'package:myflutter_task/widgets/facebook_widget.dart';
import 'package:myflutter_task/widgets/google_widget.dart';
import 'package:provider/provider.dart';

class Mywelcome extends StatefulWidget {
  Mywelcome({Key? key}) : super(key: key);

  @override
  State<Mywelcome> createState() => _MywelcomeState();
}

class _MywelcomeState extends State<Mywelcome> {
  TextEditingController _Emailcontroller = TextEditingController();
  String get email => _Emailcontroller.text;

  @override
  void dispose() {
    _Emailcontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Provider.of<AuthProvider>(context),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Image.asset("assets/back.jpeg"),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.3,
                        left: MediaQuery.of(context).size.width * 0.07),
                    child: const Text(
                      "Hi!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.37,
                        left: MediaQuery.of(context).size.width * 0.02),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: MediaQuery.of(context).size.height * 0.55,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(48, 48, 48, 0.698),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: TextFormField(
                                controller: _Emailcontroller,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: 'Email',
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0))),
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.007,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Consumer<AuthProvider>(
                                builder: (context, auth, child) {
                                  switch (auth.authStatus) {
                                    case AuthStatus.loggedIn:
                                      Future.delayed(Duration.zero, () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const MyLogin(),
                                          ),
                                        );
                                      });
                                      break;
                                    case AuthStatus.needsSignup:
                                      Future.delayed(Duration.zero, () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const Mysignup(),
                                            settings: RouteSettings(
                                              arguments: email,
                                            ),
                                          ),
                                        );
                                      });
                                      break;
                                    default:
                                      return ElevatedButton(
                                        onPressed: () {
                                          print('Button Pressed');
                                          Provider.of<AuthProvider>(context,
                                                  listen: false)
                                              .checkEmailExistence(
                                                  _Emailcontroller.text);
                                        },
                                        child: Text(
                                          "Continue",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                            Color.fromARGB(255, 134, 243, 134),
                                          ),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                      );
                                  }
                                  return Container(); // Return an empty widget to satisfy the return type
                                },
                              ),
                            ),
                            const Text(
                              "or",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                            const Facebookwidget(),
                            const SizedBox(
                              height: 10,
                            ),
                            const Googlewidget(),
                            const SizedBox(
                              height: 10,
                            ),
                            const Applewidget(),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "signup",
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 134, 243, 134)),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * 0.44),
                              child: const Text(
                                "Forgot Your Password",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 134, 243, 134)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
