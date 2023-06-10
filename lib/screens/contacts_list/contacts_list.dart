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
        // runs when notifyListeners() is called from the model
        builder: (context, child, model) {
      return ListView.builder(
          itemCount: model.contacts.length,
          itemBuilder: (context, index) {
            return ContactTile(
              contactIndex: index,
            );
          });
    });
  }
}
