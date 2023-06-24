import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learningdart/features/screens/profile/profile_view_model.dart';
import 'package:learningdart/shared/reponse_code.dart';
import 'package:learningdart/widget/submit_button.dart';
import 'package:learningdart/features/screens/profile/profile_screen.dart';

class PasswordScreen extends ConsumerStatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  PasswordScreenState createState() => PasswordScreenState();
}

class PasswordScreenState extends ConsumerState<PasswordScreen> {
  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  final TextEditingController _confirmPasswordTextEditingController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordTextEditingController.dispose();
    _confirmPasswordTextEditingController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Update password"),
          backgroundColor: Colors.purple,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white12),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
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
                        "Update your password",
                        style: TextStyle(
                            color: Color.fromARGB(255, 24, 8, 69),
                            fontSize: 28,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            // field for password

                            TextFormField(
                              controller: _passwordTextEditingController,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.password),
                                hintText: "Your new password",
                                labelText: 'Password *',
                              ),
                              obscureText: true,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),

                            // field for password

                            TextFormField(
                              controller: _confirmPasswordTextEditingController,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.password),
                                hintText: "Confirm new password",
                                labelText: 'Confirm password *',
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
                              buttonText: 'Update',
                              onTapFunc: updatePassword,
                            ),
                          ],
                        )),
                  ],
                )))),
      ),
    );
  }

  Future<void> updatePassword() async {
    // check if the form inputs are valid
    final form = _formKey.currentState;

    if (form!.validate()) {
      try {
        await ref.read(profileViewModelProvider).updatePassword(
            _passwordTextEditingController.text,
            _confirmPasswordTextEditingController.text);

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const ProfileScreen();
        }));
      } catch (e) {
        // handle error here
        print(e.toString());
        if (e.toString() == ResponseCode.unauthorized['exc']) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Access Denied'),
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
