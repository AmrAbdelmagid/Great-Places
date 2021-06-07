import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Future<Database> database() async{
    final dbPath = await sql.getDatabasesPath(); // db location
    return sql.openDatabase(path.join(dbPath, 'places.dp'),
        onCreate: (db, version) {
          return db.execute(
              "CREATE TABLE user_places (id TEXT PRIMARY KEY, title TEXT, image TEXT)");
        }, version: 1);
  }
  static Future<void> insert(String table, Map<String, Object> data) async {
    final database = await DBHelper.database();

    database.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }
   static Future<List<Map<String, Object>>> getData(String table) async {
     final database = await DBHelper.database();
     return database.query(table);

   }
}
