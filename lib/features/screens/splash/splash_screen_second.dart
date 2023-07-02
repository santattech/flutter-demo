//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learningdart/features/screens/login/login_screen.dart';
import 'package:learningdart/features/screens/splash/MyHomePage.dart';
import 'package:learningdart/shared/app_secret.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {
  int splashtime = 10;
  // the above is the duration of the splash screen

  @override
  void initState() {
    Future.delayed(Duration(seconds: splashtime), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        if (AppSecret.accessToken == null) {
          return const LoginScreen();
        } else {
          return const MyHomePage(title: 'Home');
        }
      }));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            color: Color.fromARGB(255, 21, 19, 19),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //vertically align center

                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 0),
                    child: SizedBox(
                        height: 600,
                        width: 500,
                        child: Image.asset('images/splashIcon.png')),
                  ),
                  AppVersion(),
                ])));
  }
}

class AppVersion extends StatelessWidget {
  const AppVersion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: const Text("Version: 1.0.0",
          style: TextStyle(
            color: Colors.white24,
            fontSize: 20,
          )),
    );
  }
}

class StillWorkingMessage extends StatelessWidget {
  const StillWorkingMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      //margin top 30
      child: const Text(
        "We are still working",
        style: TextStyle(
          fontSize: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
