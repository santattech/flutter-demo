import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learningdart/widget/submit_button.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

final helloWorldProvider = Provider((ref) => 'Hello world');

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
  void initState() {
    super.initState();
    // ref can be accessible anywhere in all lifecylcles of stateful widget
    ref.read(helloWorldProvider);
  }

  @override
  void dispose() {
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final String value = ref.watch(helloWorldProvider);

    return Container(
      child: Scaffold(
        body: SafeArea(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
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

                            SubmitButton(),
                          ],
                        )),
                  ],
                )))),
      ),
    );
  }

  void login() async {}
}
