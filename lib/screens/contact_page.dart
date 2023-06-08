import 'package:flutter/material.dart';
import 'package:learningdart/model/contacts_model.dart';
import 'package:learningdart/screens/contacts_list/contacts_list.dart';
import 'package:scoped_model/scoped_model.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: ContactsModel(),
      child: MaterialApp(
          title: 'Contacts',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: Scaffold(
            appBar: AppBar(title: const Text('Contacts')),
            body: ConatactListPage(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/contact_form');
              },
              tooltip: 'Add',
              child: const Icon(Icons.add),
            ),
          )),
    );
  }
}
