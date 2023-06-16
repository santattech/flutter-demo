import 'package:flutter/material.dart';
import 'contact_form.dart';
import 'package:learningdart/data/Contact.dart';

class ContactEditForm extends StatelessWidget {
  final Contact editedContact;
  final int editedContactIndex;

  const ContactEditForm({
    Key? key,
    required this.editedContact,
    required this.editedContactIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit')),
      body: ContactForm(
        title: 'Edit contact',
        editedContact: editedContact,
        editedContactIndex: editedContactIndex,
      ),
    );
  }
}
