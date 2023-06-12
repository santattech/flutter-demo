import 'package:scoped_model/scoped_model.dart';
import 'package:learningdart/data/Contact.dart';
import 'package:faker/faker.dart';

class ContactsModel extends Model {
  // underscore acts like a private access modifer
  final List<Contact> _contacts = List.generate(2, (index) {
    return Contact(
        name: "${faker.person.firstName()} ${faker.person.lastName()}",
        email: faker.internet.freeEmail(),
        phoneNumber: '88235262728');
  });

  /// Wraps [ScopedModel.of] for this [Model]. See [ScopedModel.of] for more
  static ContactsModel of(context) => ScopedModel.of<ContactsModel>(context);

  List<Contact> get contacts => _contacts;

  void addContact(Contact newContact) {
    _contacts.add(newContact);
    notifyListeners();
  }

  void updateContact(Contact updatedContact, int index) {
    _contacts[index] = updatedContact;
    notifyListeners();
  }

  void deleteContact(int index) {
    _contacts.removeAt(index);
    notifyListeners();
  }

  void changeFavouriteStatus(int index) {
    contacts[index].isFavourite = !contacts[index].isFavourite;

    notifyListeners();
  }
}
