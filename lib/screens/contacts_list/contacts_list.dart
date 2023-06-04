import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:learningdart/model/contacts_model.dart';
import 'package:learningdart/widget/contact_tile.dart';

class ConatactListPage extends StatefulWidget {
  @override
  _ConatactListPageState createState() => _ConatactListPageState();
}

class _ConatactListPageState extends State<ConatactListPage> {
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ContactsModel>(
        builder: (context, child, model) {
      return ListView.builder(
          itemCount: model.contacts.length,
          itemBuilder: (context, index) {
            return ContactTile(
              contact: model.contacts[index],
              onFavouritePressed: () {
                setState(() {
                  model.contacts[index].isFavourite =
                      !model.contacts[index].isFavourite;
                });
              },
            );
          });
    });
  }
}
