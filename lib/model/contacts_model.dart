import 'package:scoped_model/scoped_model.dart';
import 'package:learningdart/data/Contact.dart';
import 'package:faker/faker.dart';

class ContactsModel extends Model {
  // underscore acts like a private access modifer
  final List<Contact> _contacts = List.generate(50, (index) {
    return Contact(
        name: "${faker.person.firstName()} ${faker.person.lastName()}",
        email: faker.internet.freeEmail(),
        phoneNumber: '88235262728');
  });

  List<Contact> get contacts => _contacts;

  void changeFavouriteStatus(int index) {
    contacts[index].isFavourite = !contacts[index].isFavourite;
  }
}
