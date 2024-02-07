import 'package:flutter/material.dart';
import 'package:myflutter_task/firebase_options.dart';
import 'package:myflutter_task/welcome_screen/welcome_screen.dart';
import 'package:myflutter_task/welcome_screen/welcome_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    Builder(
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AuthProvider(
              navigatorKey: navigatorKey,
              context: context,
            ),
          ),
        ],
        child: Mywelcome(),
      ),
    );
  }
}
