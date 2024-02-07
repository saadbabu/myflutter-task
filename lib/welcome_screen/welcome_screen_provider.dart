import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myflutter_task/Signup_screen/signup_screen.dart';
import 'package:myflutter_task/login_screen/login_screen.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthStatus _authStatus = AuthStatus.unknown;
  final GlobalKey<NavigatorState> navigatorKey;
  final BuildContext context;

  AuthProvider({required this.navigatorKey, required this.context});

  AuthStatus get authStatus => _authStatus;

  Future<void> checkEmailExistence(String email) async {
    print('Checking email existence for $email');
    final snapshot =
        await FirebaseFirestore.instance.collection('users').doc(email).get();

    if (snapshot.exists) {
      // Email exists, navigate to login screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MyLogin()),
      );
    } else {
      // Email doesn't exist, navigate to signup screen
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const Mysignup(),
          settings: RouteSettings(arguments: email),
        ),
      );
    }
  }
}

enum AuthStatus {
  loggedIn,
  needsSignup,
  unknown,
}
