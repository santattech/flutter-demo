import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
    //return ScopedModelDescendant<ContactsModel>(
    //    builder: (context, child, model) {
    final model = ScopedModel.of<ContactsModel>(context);
    final displayedContact = model.contacts[contactIndex];

    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
          motion: const BehindMotion(),
          // this is for if we want to dismiss the item on slide,
          // we are coomenting it for now as we dont want.
          // dismissible: DismissiblePane(
          //   onDismissed: () {},
          // ),
          children: [
            SlidableAction(
              onPressed: (BuildContext context) =>
                  model.deleteContact(contactIndex),
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ]),
      child: Material(
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
      ),
    );
    //});
  }
}
