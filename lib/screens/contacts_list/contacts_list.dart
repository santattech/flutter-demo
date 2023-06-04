import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:learningdart/data/Contact.dart';
import 'package:learningdart/widget/ContactTile.dart';

class ConatactListPage extends StatefulWidget {
  @override
  _ConatactListPageState createState() => _ConatactListPageState();
}

class _ConatactListPageState extends State<ConatactListPage> {
  // underscore acts like a private access modifer
  late List<Contact> _contacts;

  @override
  void initState() {
    super.initState();
    _contacts = List.generate(50, (index) {
      return Contact(
          name: "${faker.person.firstName()} ${faker.person.lastName()}",
          email: faker.internet.freeEmail(),
          phoneNumber: '88235262728');
    });
  }

  Widget build(BuildContext context) {
    //final faker = Faker();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _contacts.length,
          itemBuilder: (context, index) {
            return ContactTile(
              contact: _contacts[index],
              onFavouritePressed: () {
                setState(() {
                  _contacts[index].isFavourite = !_contacts[index].isFavourite;
                });
              },
            );
          },
        ),
      ),
    );
  }
}
