import 'package:flutter/material.dart';
import 'package:learningdart/screens/contacts_list/contacts_list.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ConatactListPage(),
    );
  }
}
