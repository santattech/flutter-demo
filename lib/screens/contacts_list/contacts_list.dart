import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class ConatactListPage extends StatelessWidget {
  List<Contact> _contacts = List.generate(50, (index) {
    return Contact(
      name: faker.person.firstName() + ' ' + faker.person.lastName(),
      email: faker.internet.freeEmail(),
      phoneNumber: faker.RandomGenerator()
    )
  });
  
  @override
  Widget build(BuildContext context) {
    final faker = Faker();

    return Scaffold(
      appBar: AppBar(
        title: Text('Contact'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 30,
          itemBuilder: (context, index) {
            return Center(
              child: Text(
                faker.person.firstName() + ' ' + faker.person.lastName(),
                style: const TextStyle(fontSize: 30),
              ),
            );
          },
        ),
      ),
    );
  }
}
