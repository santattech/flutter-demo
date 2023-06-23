import 'dart:core';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learningdart/model/user_model.dart';
import 'package:learningdart/widget/nav_drawer.dart';
import 'package:learningdart/features/screens/profile/profile_view_model.dart';

class ProfileScreen extends ConsumerWidget {
  UserModel? user;

  @override
  Widget build(BuildContext context, ref) {
    final userprof = ref.read(profileViewModelProvider).getUser();

    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.purple,
      ),
      body: ListView(
        children: [
          // Email needs to be shown
          Card(
            child: ListTile(
              leading: Icon(Icons.email_rounded),
              title: Text('sa'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.timer),
              title: Text('Last sign in'),
              subtitle: Text('2 hours ago'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          // Current login
          Card(
            child: ListTile(
              leading: Icon(Icons.schedule),
              title: Text('Current sign in'),
              subtitle: Text('2 mins ago'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> getUser(ref) async {
  // call the getUser API

  try {
    await ref.read(profileViewModelProvider).getUser();
  } catch (e) {
    // handle error here
  }
}
