import 'dart:core';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learningdart/features/screens/profile/password_screen.dart';
import 'package:learningdart/model/user_model.dart';
import 'package:learningdart/shared/server_error_component.dart';
import 'package:learningdart/widget/nav_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:learningdart/shared/app_secret.dart';
import 'package:learningdart/shared/loading_component.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreen();
}

Future<UserModel> getUser() async {
  // call the getUser API
  const String apiUrl = AppSecret.getUserUrl;
  Map<String, String> headerData = {
    "Content-Type": 'application/json',
    'Authorization': AppSecret.accessToken,
  };

  try {
    http.Response response =
        await http.get(Uri.parse(apiUrl), headers: headerData);

    return UserModel.fromJson(parseResponseBody(response));
  } catch (e) {
    rethrow;
  }
}

Map<String, dynamic> parseResponseBody(http.Response response) {
  if (response.statusCode == 200) {
    return jsonDecode(response.body) as Map<String, dynamic>;
  } else if (response.statusCode == 404) {
    throw Exception('Wrong creds');
  } else if (response.statusCode == 401) {
    throw Exception('Unauthorize');
  } else {
    throw Exception('Something went wrong');
  }
}

class _ProfileScreen extends ConsumerState<ProfileScreen> {
  String? email;
  String? lastSignAt;
  String? currentSignInAt;
  String? updatedAt;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.purple,
      ),
      body: FutureBuilder<UserModel>(
          future: getUser(),
          builder: (
            context,
            snapshot,
          ) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingComponent();
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                print(snapshot.error);
                return const ServerErrorComponent();
              } else if (snapshot.hasData) {
                final data = snapshot.data!;
                email = data.email;
                lastSignAt = data.lastSignInAt;
                currentSignInAt = data.currentSignInAt;
                updatedAt = data.updatedAt;

                return ListView(
                  children: [
                    // Email needs to be shown
                    Card(
                      child: ListTile(
                        leading: const Icon(Icons.email_rounded),
                        title: Text('$email'),
                      ),
                    ),

                    // last sign in shown
                    Card(
                      child: ListTile(
                        leading: const Icon(Icons.timer),
                        title: const Text('Last sign in'),
                        subtitle: Text('$lastSignAt'),
                      ),
                    ),

                    // current sign in shown
                    Card(
                      child: ListTile(
                        leading: const Icon(Icons.timer),
                        title: const Text('Current sign in'),
                        subtitle: Text('$currentSignInAt'),
                      ),
                    ),

                    // last updated in shown
                    Card(
                      child: ListTile(
                        leading: const Icon(Icons.timer),
                        title: const Text('Last updated on'),
                        subtitle: Text('$updatedAt'),
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const PasswordScreen();
                              }));
                            },
                            icon: const Icon(Icons.more_vert)),
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: Text(
                    'Nothing to be shown',
                    style: TextStyle(
                        color: Color.fromARGB(255, 24, 8, 69), fontSize: 16),
                  ),
                );
              }
            } else {
              return Text('State: ${snapshot.connectionState}');
            }
          }),
    );
  }

  void redirectToPasswordUpdate(context) {}
}
