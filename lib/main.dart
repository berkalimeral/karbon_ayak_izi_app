import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:karbon_ayak_izi_app/screens/signIn_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        headline2: TextStyle(fontSize: 64.0, fontWeight: FontWeight.bold),
        headline3: TextStyle(fontSize: 56.0, fontWeight: FontWeight.bold),
        headline4: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
        headline5: TextStyle(
            fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.white),
        headline6: TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
      )),
      home: const LoginPage(),
    );
  }
}
