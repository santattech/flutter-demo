import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key, required this.title});

  final String title;

  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _email;
  String? _phoneNumber;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Contact form',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Contact Form'),
            ),
            body: Form(
              key: _formKey,
              child: ListView(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: "Put the person's good name",
                      labelText: 'Name *',
                    ),
                    onSaved: (value) => _name = '$value',
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      hintText: "Put the person's email",
                      labelText: 'Email *',
                    ),
                    onSaved: (value) => _email = '$value',
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.phone),
                      hintText: "Put the person's phone number",
                      labelText: 'Number *',
                    ),
                    onSaved: (value) => _phoneNumber = '$value',
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 65, 153, 225),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    ),
                    onPressed: () {
                      final form = _formKey.currentState;
                      // if (form != null && !form.validate()) {
                      //   // Invalid!
                      //   return;
                      // }

                      if (form != null) form.save();
                    },
                    child: const Text('Save'),
                  )
                ],
              ),
            )));
  }
}
