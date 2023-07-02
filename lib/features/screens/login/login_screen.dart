import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learningdart/features/screens/login/login_view_model.dart';
import 'package:learningdart/widget/submit_button.dart';
import 'package:learningdart/features/screens/splash/MyHomePage.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();

  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SafeArea(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 24),
                      child: Text(
                        "Login screen",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 28,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            // field for email
                            TextFormField(
                              controller: _emailTextEditingController,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.email),
                                hintText: "Your email",
                                labelText: 'Username *',
                              ),
                              validator: (value) {
                                final _regExp = RegExp(
                                    "([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\"\(\[\]!#-[^-~ \t]|(\\[\t -~]))+\")@([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\[[\t -Z^-~]*])");

                                if (value == null || value.isEmpty) {
                                  return 'Please enter some name';
                                } else if (!_regExp.hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.emailAddress,
                            ),

                            // field for password

                            TextFormField(
                              controller: _passwordTextEditingController,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.password),
                                hintText: "Your password",
                                labelText: 'Password *',
                              ),
                              obscureText: true,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),

                            // give some gap
                            const SizedBox(
                              height: 20,
                            ),

                            SubmitButton(
                              buttonText: 'Login',
                              onTapFunc: login,
                            ),
                          ],
                        )),
                  ],
                )))),
      ),
    );
  }

  Future<void> login() async {
    // check if the form inputs are valid
    final form = _formKey.currentState;

    if (form!.validate()) {
      try {
        await ref.read(loginViewModelProvider).login(
            _emailTextEditingController.text,
            _passwordTextEditingController.text);

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const MyHomePage(title: 'Home');
        }));
      } catch (e) {
        // handle error here
        if (e.toString() == 'Exception: Wrong creds') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Please check your credentials'),
            duration: Duration(seconds: 5),
            backgroundColor: Colors.red,
          ));
        }
        // for the 500 error
        else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Something went wrong'),
            duration: Duration(seconds: 5),
            backgroundColor: Colors.red,
          ));
        }
      }
    }
  }
}
