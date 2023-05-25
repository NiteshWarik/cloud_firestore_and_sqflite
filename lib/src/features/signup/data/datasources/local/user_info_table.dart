import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

class UserInfoTable {
  static const String TABLE_NAME = "user_info";

  static const String COLUMN_ID = "id";
  static const String COLUMN_FIRST_NAME = "first_name";
  static const String COLUMN_LAST_NAME = "last_name";
  static const String COLUMN_EMAIL = "email";
  static const String COLUMN_MOBILE_NUMBER = "mobile_number";
  static const String COLUMN_IS_UPLOADED = "is_uploaded";

  static const String CREATE_TABLE = '''CREATE TABLE if not exists $TABLE_NAME(
      $COLUMN_ID INTEGER PRIMARY KEY AUTOINCREMENT,
      $COLUMN_FIRST_NAME TEXT NOT NULL,
      $COLUMN_LAST_NAME TEXT NOT NULL,
      $COLUMN_EMAIL TEXT NOT NULL,
      $COLUMN_MOBILE_NUMBER TEXT NOT NULL,
      $COLUMN_IS_UPLOADED INTEGER NOT NULL
    )''';

  static void onCreate(Database database) {
    database.execute(CREATE_TABLE);
    debugPrint('UserInfo Table Created');
  }

  static void onUpgrade(Database database, int oldVersion, int newVersion) {
    database.execute("DROP TABLE IF EXISTS ${UserInfoTable.TABLE_NAME}");
    onCreate(database);
  }
}
