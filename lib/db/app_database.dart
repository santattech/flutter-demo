import 'dart:async';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class AppDatabase {
  static final AppDatabase _singleton = AppDatabase._();

  static AppDatabase get instance => _singleton;

  // Completer is- used for completeing synchronus code in to asyncronus code
  Completer<Database> _dbOpenCompleter;

  //A pvt constructor
  // can be called its own constructor, it immediately loose the default constructor.
  // This means that by provising a pvt constructor, we can create new instance
  // only from within this SembastDb class itself.

  AppDatabase._();

  Future<Database> get database async {
    // if completer is null, db is not opened
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();
      _openDatabase();
      AppDatabase._();
    }

    // if the _dbOpenCompleter is present, will return immediately
    // otherwise will wait for the database to open.
    return _dbOpenCompleter.future;
  }

  Future _openDatabase() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDocumentDir.path, 'contacts.db');
    // We use the database factory to open the database
    final database = await databaseFactoryIo.openDatabase(dbPath);
    _dbOpenCompleter.complete(database);
  }
}
