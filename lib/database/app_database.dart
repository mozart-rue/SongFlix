import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> createDatabase() async {
  final String dbPath = await getDatabasesPath();
  final String path = join(dbPath, "devFlixDB.db");

  return openDatabase(
    path,
    onCreate: (db, version) {
      // db.execute("CREATE TABLE videos ( id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, category_id INTEGER, url TEXT) ");
      db.execute("CREATE TABLE videos ( "
            "id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "
            "category_id INTEGER, " 
            "url TEXT, "
            "channel_id TEXT, "
            "title TEXT, "
            "description TEXT, "
            "published_at TEXT )");

      db.execute("CREATE TABLE channels ( id TEXT PRIMARY KEY, name TEXT)");

      db.execute( 'CREATE TABLE categories ( id INTEGER, name TEXT, color INTEGER ) ');
    },
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}

