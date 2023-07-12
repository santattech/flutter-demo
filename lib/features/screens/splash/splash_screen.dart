import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:learningdart/features/screens/fuel_entries/fuel_entry_screen.dart';
import 'package:learningdart/features/screens/login/login_screen.dart';
import 'package:learningdart/features/screens/splash/MyHomePage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:learningdart/shared/app_secret.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Home',
        home: AnimatedSplashScreen(
            duration: 1000,
            splash: const Icon(
              Icons.water_drop,
              color: Colors.white,
              size: 50,
            ),
            nextScreen: AppSecret.accessToken == null
                ? const FuelEntryScreen()
                : const MyHomePage(title: 'Home'),
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.fade,
            backgroundColor: const Color.fromARGB(255, 169, 13, 13)));
  }
}
