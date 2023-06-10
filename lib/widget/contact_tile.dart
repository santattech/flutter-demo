import 'package:flutter/material.dart';
import 'package:learningdart/data/Contact.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:learningdart/model/contacts_model.dart';

class ContactTile extends StatelessWidget {
  const ContactTile({
    Key? key,
    required this.contactIndex,
  }) : super(key: key);

  final int contactIndex;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ContactsModel>(
        builder: (context, child, model) {
      final displayedContact = model.contacts[contactIndex];
      return Material(
        child: ListTile(
          title: Text(displayedContact.name),
          subtitle: Text(displayedContact.email),
          trailing: IconButton(
              icon: Icon(
                displayedContact.isFavourite ? Icons.star : Icons.star_border,
                color:
                    displayedContact.isFavourite ? Colors.amber : Colors.grey,
              ),
              onPressed: () {
                model.changeFavouriteStatus(contactIndex);
              }),
        ),
      );
    });
  }
}
