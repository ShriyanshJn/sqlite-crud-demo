import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  // variables
  static const dbName = 'myDatabase.db';
  static const dbVersion = 1;
  static const dbTable = 'myTable';
  static const columnID = 'id';
  static const columnName = 'name';

  // constructor
  static final DatabaseHelper instance = DatabaseHelper();

  // initialise database

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await initDB();
    return _database;
  }

  initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbName);
    return await openDatabase(path, version: dbVersion, onCreate: onCreate);
  }

  // create
  Future onCreate(Database db, int version) async {
    db.execute('''
        CREATE TABLE $dbTable(
          $columnID INTEGER PRIMARY KEY,
          $columnName TEXT NOT NULL,
        )
      ''');
  }

  // insert
  insert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(dbTable, row);
  }

  // read/query
  Future<List<Map<String, dynamic>>> queryDatabase() async {
    Database? db = await instance.database;
    return await db!.query(dbTable);
  }

  // update
  Future<int> update(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    int id = row[columnID];
    return await db!
        .update(dbTable, row, where: '$columnID = ?', whereArgs: [id]);
  }

  // delete
  Future<int> deleteRecord(int id) async {
    Database? db = await instance.database;
    return await db!.delete(dbTable, where: '$columnID = ?', whereArgs: [id]);
  }
}
