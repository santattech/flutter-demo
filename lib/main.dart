import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learningdart/features/screens/fuel_entries/fuel_entry_screen.dart';
import 'package:learningdart/features/screens/login/login_screen.dart';
import 'package:learningdart/features/screens/profile/password_screen.dart';
import 'package:learningdart/screens/contact_page.dart';
import 'package:learningdart/features/screens/splash/splash_screen.dart';
import 'package:learningdart/widget/contact_form.dart';
import 'screens/Screen3.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/third': (context) => Screen3(),
        '/contact': (context) => const ContactPage(title: 'Contact'),
        '/contact_form': (context) => const ContactForm(title: 'Add Contact'),
        '/updatePassword': (context) => const PasswordScreen(),
        '/fuel_entry': (context) => const FuelEntryScreen(),
      },
    );
  }
}
