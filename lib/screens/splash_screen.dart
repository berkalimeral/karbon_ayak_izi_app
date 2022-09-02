import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:karbon_ayak_izi_app/screens/signIn_page.dart';

class KarbonSplashScreen extends StatefulWidget {
  const KarbonSplashScreen({Key? key}) : super(key: key);

  @override
  State<KarbonSplashScreen> createState() => _KarbonSplashScreen();
}

class _KarbonSplashScreen extends State<KarbonSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      durationInSeconds: 3,
      navigator: const LoginPage(),
      title: Text(
        "Karbon Ayak İzim'e Hoşgeldiniz",
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headline5!
            .copyWith(color: Colors.white),
      ),
      logo: Image.asset(
        'assets/splash_image.png',
        fit: BoxFit.contain,
      ),
      loaderColor: Colors.black,
      backgroundColor: Colors.green.shade200,
    );
  }
}
