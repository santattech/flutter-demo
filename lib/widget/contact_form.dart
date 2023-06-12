import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:learningdart/data/Contact.dart';
import 'package:learningdart/model/contacts_model.dart';

ContactsModel contactsModel = ContactsModel();

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
  bool isEditmode = false;

  @override
  Widget build(BuildContext context) {
    return ScopedModel<ContactsModel>(
      model: contactsModel,
      child: MaterialApp(
        title: 'Contact form',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Contact form'),
              leading: BackButton(
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            body: Form(
              key: _formKey,
              child: ListView(
                children: [
                  _buildContactImage(),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: "Put the person's good name",
                      labelText: 'Name *',
                    ),
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
                        //var model = ContactsModel.of(context);

                        final newContact = Contact(
                          name: _name.toString(),
                          email: _email.toString(),
                          phoneNumber: _phoneNumber.toString(),
                        );

                        contactsModel.addContact(newContact);
                        // ScopedModel.of<ContactsModel>(context)
                        //     .addContact(newContact);
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget _buildContactImage() {
    final halfSized = MediaQuery.of(context).size.width / 2;
    return GestureDetector(
        onTap: _onContactPictureTapped(),
        child: CircleAvatar(
          radius: halfSized / 2,
          child: _buildCircleAvatarContent(halfSized),
        ));
  }

  _onContactPictureTapped() {
    final ImagePicker picker = ImagePicker();
    final imageFile = picker.pickImage(source: ImageSource.gallery);
    print(imageFile);
  }

  Widget _buildCircleAvatarContent(halfSized) {
    if (isEditmode) {
      return const Text(
        'A',
        style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
      );
    } else {
      return Icon(Icons.person, size: halfSized / 2);
    }
  }
}
