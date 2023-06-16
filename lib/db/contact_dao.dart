import 'package:learningdart/data/Contact.dart';
import 'package:learningdart/db/app_database.dart';
import 'package:sembast/sembast.dart';

class ContactDao {
  String const String CONTACT_STORE_NAME = 'contacts';
  // a store  with int keys and Map<String, dynamci>
  final _contactStore = intMapStoreFactory.store(CONTACT_STORE_NAME);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(Contact contact) async {
    _contactStore.add(await _db, contact.toMap());
  }

  Future update(Contact contact) async {
    final finder = Finder(filter: Filter.byKey(contact.id));

    _contactStore.update(await _db, contact.toMap(), finder: finder);
  }

  Future delete(Contact contact) async {
    final finder = Finder(filter: Filter.byKey(contact.id));

    _contactStore.delete(await _db, finder: finder);
  }
}
