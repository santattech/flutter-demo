import 'package:flutter/material.dart';
import 'package:learningdart/data/Contact.dart';

class ContactTile extends StatelessWidget {
  const ContactTile({
    Key key,
    required this.contact,
  }) : super(key: key)

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
              title: Text(contact.name),
              subtitle: Text(contact.email),
              trailing: IconButton(
                icon: Icon(
                  contact.isFavourite ? Icons.star : Icons.star_border,
                  color:
                      contact.isFavourite ? Colors.amber : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    contact.isFavourite =
                        !contact.isFavourite;
                  });
                },
              ),
            );
  }
}