import 'package:flutter/material.dart';
import 'package:myflutter_task/home_screen/home_scren.dart';
import 'package:myflutter_task/login_screen/auth_login.dart';
import 'package:myflutter_task/widgets/login_heading.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  bool ispasswordvisible = true;
  TextEditingController _passcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    void login() async {
      final String email = ModalRoute.of(context)!.settings.arguments as String;
      final result = await AuthService.loginUser(email, _passcontroller.text);

      if (result != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Myhomescreen()),
        );
      }
    }

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
                  "Log in",
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
                        const Loginhead(),
                        const SizedBox(
                          height: 20.0,
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
                              hintText: 'password',
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
                          height: 10.0,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.height * 0.065,
                          child: ElevatedButton(
                            onPressed: () {
                              login();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Myhomescreen()));
                            },
                            child: const Text(
                              "Continue",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<
                                        Color>(
                                    const Color.fromARGB(255, 134, 243, 134)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)))),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Text(
                          "Forgot Your Password?",
                          style: TextStyle(
                              color: Color.fromARGB(255, 134, 243, 134)),
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
