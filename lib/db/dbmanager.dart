// import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:fonote_demo/function/notestool.dart';

class DBManager {
  static String myDBName;
  static const int _VERSION = 1;
  static Database _database;
  static init(String stDBName) async {
    var databasePath = await getDatabasesPath();
    myDBName = stDBName;
    String path = databasePath + "/" + myDBName;
    // if (Platform.isIOS) {
    //   path = databasePath + "/" + myDBName;
    // }
    print("db path = $path");
    _database = await openDatabase(path, version: _VERSION,
        onCreate: (Database db, int version) async {
      //如果需要马上创建表,则在这里加入创建表的代码
    });
  }

  static isTableExists(String stDBName, String tableName) async {
    await getCurrentDatabase(stDBName);
    String sql =
        "select * from Sqlite_master where type = 'table' and name = '$tableName' ";
    var res = await _database.rawQuery(sql);
    // bool mret = res != null && res.length > 0;
    // return mret;
    return res != null && res.length > 0;
  }

  static createTable(
      String stDBName, String tableName, List<TableField> fieldList) async {
    // Database db = await getCurrentDatabase(stDBName);
    // init(stDBName);
    int nCount = 0;
    String sql = "CREATE TABLE $tableName(";
    fieldList.forEach((field) {
      if (field.fieldType == FieldType.key) {
        sql += " ";
        sql += field.fieldName;
        sql += " CHAR(36) PRIMARY KEY ";
      }
      if (field.fieldType == FieldType.integer) {
        sql += " ";
        sql += field.fieldName;
        sql += " INT ";
      }

      if (field.fieldType == FieldType.char) {
        sql += " ";
        sql += field.fieldName;
        sql += " CHAR(";
        sql += field.fieldLength.toString();
        sql += ")";
      }

      if (field.fieldType == FieldType.real) {
        sql += " ";
        sql += field.fieldName;
        sql += " REAL ";
      }

      if (field.fieldType == FieldType.text) {
        sql += " ";
        sql += field.fieldName;
        sql += " TEXT ";
      }
      if (field.fieldType == FieldType.timestamp) {
        sql += " ";
        sql += field.fieldName;
        sql += " TIMESTAMP DEFAULT CURRENT_TIMESTAMP ";
      }

      if (field.notNull) {
        sql += " NOT NULL ";
      }
      nCount++;
      if (nCount < fieldList.length) {
        sql += ",";
      }
    });
    sql += ")";
    print("createTable() sql = $sql");
    return await _database.execute(sql);
  }

  static getTableNamesFromDB(String stDBName) async {
    var sql =
        "select name from sqlite_master where type = 'table' and name <> 'android_metadata'";
    await init(stDBName);
    List<String> tableNames = [];
    List<Map> list = [];
    if (_database != null) {
      list = await _database.rawQuery(sql);
      int ni = 0;
      if (list.isNotEmpty) {
        list.forEach((element) {
          // tableNames.add(element.values.elementAt(ni));
          tableNames.add(element.values.elementAt(0));
          ni++;
        });
      }
    }

    return tableNames;
    // list.forEach((element) {
    //   print("element.toString();" + element.toString());
    //   print("element.values.toString();" + element.values.toString());
    //   print("element.keys.toString();" + element.keys.toString());
    //   print("element.keys.elementAt(ni);" + element.keys.elementAt(ni));
    //   print("element.values.elementAt(ni);" + element.values.elementAt(ni));
    // });
  }

  static Future<Database> getCurrentDatabase(String stDBName) async {
    if (_database == null) {
      await init(stDBName);
    }
    return _database;
  }

  static close() {
    if (_database != null) {
      _database.close();
      _database = null;
    }
  }
}
