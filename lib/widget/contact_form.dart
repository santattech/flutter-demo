import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:learningdart/data/Contact.dart';
import 'package:learningdart/model/contacts_model.dart';

ContactsModel contactsModel = ContactsModel();

class ContactForm extends StatefulWidget {
  final Contact? editedContact;
  final int? editedContactIndex;

  final String title;

  const ContactForm({
    Key? key,
    this.editedContact,
    this.editedContactIndex,
    required this.title,
  });

  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _email;
  String? _phoneNumber;
  int? contactIndex;

  @override
  Widget build(BuildContext context) {
    if (widget.editedContact != null) {
      _email = widget.editedContact?.email;
      _name = widget.editedContact?.name;
      _phoneNumber = widget.editedContact?.phoneNumber;
    }

    if (widget.editedContactIndex != null) {
      contactIndex = widget.editedContactIndex;
    }

    return ScopedModelDescendant<ContactsModel>(
        builder: (context, child, model) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Contact form',
        home: Scaffold(
            //appBar: AppBar(title: const Text('Contact form')),
            body: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 10.0),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: "Put the person's good name",
                  labelText: 'Name *',
                ),
                initialValue: _name.toString(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some name';
                  }
                  return null;
                },
                onSaved: (value) => _name = '$value',
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: "Put the person's email",
                  labelText: 'Email *',
                ),
                initialValue: _email.toString(),
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
                onSaved: (value) => _email = '$value',
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                initialValue: _phoneNumber.toString(),
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone),
                  hintText: "Put the person's phone number",
                  labelText: 'Number *',
                ),
                onSaved: (value) => _phoneNumber = '$value',
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 65, 153, 225),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                ),
                onPressed: () {
                  final form = _formKey.currentState;
                  if (form != null && !form.validate()) {
                    // Invalid!
                    return;
                  }

                  if (form != null) {
                    form.save();

                    final newContact = Contact(
                      name: _name.toString(),
                      email: _email.toString(),
                      phoneNumber: _phoneNumber.toString(),
                    );

                    if (widget.editedContactIndex == null) {
                      model.addContact(newContact);
                    } else {
                      model.updateContact(newContact, contactIndex);
                    }

                    Navigator.pop(context);
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        )),
      );
    });
  }
}
