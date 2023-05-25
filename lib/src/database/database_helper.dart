import 'dart:io';
import 'package:final_review_app/src/features/signup/data/datasources/local/user_info_table.dart';
import 'package:final_review_app/src/features/signup/domain/models/user_info_db_model.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  Database? _database;
  static const _databaseName = 'Local_DB.db';
  static const databaseVersion = 1;
  //static const _databasePath = getApplicationDocumentsDirectory() + _databaseName;
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    debugPrint('-----Path-----${path}');
    return await openDatabase(path,
        version: databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    UserInfoTable.onCreate(db);
  }

  Future insert(Map<String, dynamic> row, String table) async {
    // print(table);
    final Database db = await database;
    try {
      var a = await db.insert(
        table,
        row,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      debugPrint('$table DbException $e');
    }
  }

  var userList;
  Future<List<Map<String, dynamic>>> getUnsyncedUsers() async {
    final Database db = await database;
    String sql = ''' select * from user_info where is_uploaded = 0 ''';

    var result = await db.rawQuery(sql);
    userList = result;
    return result;
  }


 
  Future<void> updateIsUploaded() async {
    final Database db = await database;
    await db.update(
      'user_info', // replace with your table name
      {'is_uploaded': 1},
      where: 'is_uploaded = 0',
    );
  }
}
