import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:learningdart/data/Contact.dart';

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
            return ListTile(
              title: Text(_contacts[index].name),
              subtitle: Text(_contacts[index].email),
              trailing: IconButton(
                icon: Icon(
                  _contacts[index].isFavourite ? Icons.star : Icons.star_border,
                  color:
                      _contacts[index].isFavourite ? Colors.amber : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _contacts[index].isFavourite =
                        !_contacts[index].isFavourite;
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
