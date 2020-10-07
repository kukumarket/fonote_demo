// import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:fonote_demo/function/notestool.dart';
import 'package:fonote_demo/tools/tools.dart';

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
        // sql += " TIMESTAMP DEFAULT CURRENT_TIMESTAMP ";
        sql += " TIMESTAMP DEFAULT (datetime('now','localtime'))";
      }
      if (field.fieldType == FieldType.timestamp_not_now) {
        sql += " ";
        sql += field.fieldName;
        // sql += " TIMESTAMP DEFAULT CURRENT_TIMESTAMP ";
        //sql += " TIMESTAMP DEFAULT (datetime('now','localtime'))";
        sql += " TIMESTAMP ";
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
      // int ni = 0;
      if (list.isNotEmpty) {
        list.forEach((element) {
          // tableNames.add(element.values.elementAt(ni));
          tableNames.add(element.values.elementAt(0));
          // ni++;
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

  /// countPage方法用于统计数据表中记录的数量
  ///
  // static Future<int> countPage(String noteBookName) async {
  //   String sql = "select count(*) from $noteBookName as xnum";
  //   int mret = 0;
  //   List<Map> list = [];
  //   if (_database != null) {
  //     list = await _database.rawQuery(sql);
  //     list.forEach((element) {
  //       print("countPage is ");
  //       print(element.values.elementAt(0));
  //       mret = element.values.elementAt(0);
  //     });
  //   }
  //   return mret;
  // }
  static Future<String> getFirstEmptyPage(String noteBookName) async {
    String newGuid = "";
    List<Map> mQuery = [];
    if ((_database != null) && (noteBookName != null)) {
      String sql =
          "select * from $noteBookName where first_datetime isnull order by create_datetime limit 0,1";
      print("Show getFirstEmptyPage sql :");
      print(sql);
      mQuery = await _database.rawQuery(sql);
      print("Data in mQuery is :");
      print(mQuery);
      Map mt = new Map();
      mt = mQuery[0];
      print("Data id is : " + mt['id']);
      newGuid = mt["id"];
    }
    return newGuid;
  }
  // static Future<String> newNotePage(String noteBookName) async {
  //   //--insert into '测试笔记本'(id,page,topic,mainbody)values('3671FC6A-B3C4-A0B0-825D-596FE6EBB3E8',0,'','')
  //   String newGuid = "";
  //   if ((_database != null) && (noteBookName != null)) {
  //     newGuid = UidTool.getuuid();
  //     String sql =
  //         "insert into $noteBookName (id,page,topic,mainbody) values('$newGuid',0,'','') ";
  //     print("newNotePage:sql = ");
  //     print(sql);
  //     await _database.execute(sql);
  //   }
  //   return newGuid;
  // }

  static Future<String> buildNotePages(String noteBookName, int pageNum) async {
    //--insert into '测试笔记本'(id,page,topic,mainbody)values('3671FC6A-B3C4-A0B0-825D-596FE6EBB3E8',0,'','')
    print("buildNotePages() ->");
    String newGuid = "";
    await init(GlobalDefines.noteDB);

    if ((_database != null) && (noteBookName != null)) {
      newGuid = UidTool.getuuid();
      String sql =
          "insert into $noteBookName (id,page,topic,mainbody) values('$newGuid',$pageNum,'','') ";
      print("newNotePage:sql = $sql");
      // await _database.execute(sql);
      // 用 rawInsert取代了execute
      await _database.rawInsert(sql);
    }
    print("buildNotePages() <-");
    return newGuid;
  }

  static Future<String> updataNotePage(String noteBookName, String notePageID,
      String pageTitle, String pageMemo) async {
    print("updataNotePage() ->");
    String newGuid = "";

    if ((_database != null) && (noteBookName != null)) {
      newGuid = notePageID;
      String sql =
          "UPDATE $noteBookName SET topic = ? , mainbody = ? WHERE id = '$notePageID' ";
      print("updataNotePage:sql = $sql");
      await _database.rawUpdate(sql, [pageTitle, pageMemo]);
      //接下来需要更新时间字段
      bool checkFirstTime = await _firstTimeisNull(noteBookName, notePageID);
      if (checkFirstTime) {
        //如果第一次更新时间为空
        //则更新第一次更新时间和最后一次更新时间为系统时间
        sql =
            "UPDATE $noteBookName SET first_datetime = ? , last_datetime = ? WHERE id = '$notePageID' ";
        print("updataNotePage:sql = $sql");
        await _database.rawUpdate(
            sql, [DateTime.now().toString(), DateTime.now().toString()]);
      } else {
        //如果第一次更新时间不为空
        //则更新最后一次更新时间为系统时间
        sql =
            "UPDATE $noteBookName SET last_datetime = ? WHERE id = '$notePageID' ";
        print("updataNotePage:sql = $sql");

        await _database.rawUpdate(sql, [DateTime.now().toString()]);
      }
    }
    print("updataNotePage() <-");
    return newGuid;
  }

  static Future<bool> _firstTimeisNull(
      String noteBookName, String notePageID) async {
    String emptyPageID = await getFirstEmptyPage(noteBookName);
    return emptyPageID == notePageID ? true : false;
  }
}

//下面是开放给用户调用的函数
Future<String> getEmptyPage(String noteBookName) async {
  String pageID = "";
  await DBManager.init(GlobalDefines.noteDB);
  pageID = await DBManager.getFirstEmptyPage(noteBookName);
  await DBManager.close();
  return pageID;
}

Future<String> updataPage(String noteBookName, String notePageID,
    String pageTitle, String pageMemo) async {
  String pageID = "";
  await DBManager.init(GlobalDefines.noteDB);
  pageID = await DBManager.updataNotePage(
      noteBookName, notePageID, pageTitle, pageMemo);
  await DBManager.close();
  return pageID;
}
