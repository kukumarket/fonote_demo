import 'package:sqflite/sqflite.dart';
import 'package:fonote_demo/tools/tools.dart';
import 'package:fonote_demo/datalib/datalib-001.dart';
/////////////////////////////////////////////////////////////
/// 数据库相关的方法都放在数据库管理类中

class DatabaseManager {
  Database _database;

  String stDatabasePath = "";
  bool _isOpened() {
    return _database != null && _database.isOpen;
  }

  _closeDB() {
    if (_isOpened()) {
      _database.close();
      _database = null;
    }
  }

  _getCurrentDatabase({String stDBName = "fonote.db"}) async {
    if (_database == null) {
      await initDB(stDBName: stDBName);
    }
  }

  Future<String> getFirstEmptyPage(String noteBookName,
      {String stDBName = "fonote.db"}) async {
    if (!_isOpened()) {
      await _getCurrentDatabase(stDBName: stDBName);
    }
    String newGuid = "";
    List<Map> mQuery = [];
    if ((_isOpened()) && (noteBookName != null)) {
      String sql =
          "select * from $noteBookName where first_datetime isnull order by create_datetime limit 0,1";
      print("Show getFirstEmptyPage sql : " + sql);
      mQuery = await _database.rawQuery(sql);
      print("Data in mQuery is : " + mQuery.toString());
      Map mt = new Map();
      mt = mQuery[0];
      newGuid = mt["id"];
      print("Data id is : " + mt['id']);
    }
    _closeDB();
    return newGuid;
  }

  Future<String> buildNotePages(String noteBookName, int pageNum,
      {String stDBName = "fonote.db"}) async {
    //--insert into '测试笔记本'(id,page,topic,mainbody)values('3671FC6A-B3C4-A0B0-825D-596FE6EBB3E8',0,'','')
    print("buildNotePages() ->");
    if (!_isOpened()) {
      await _getCurrentDatabase(stDBName: stDBName);
    }
    String newGuid = "";
    TooLib tools = TooLib();
    newGuid = tools.getuuid();
    // await init(GlobalDefines.noteDB);

    if (noteBookName != null) {
      String sql =
          "insert into $noteBookName (id,page,topic,mainbody) values('$newGuid',$pageNum,'','') ";
      print("newNotePage:sql = $sql");
      // await _database.execute(sql);
      // 用 rawInsert取代了execute
      await _database.rawInsert(sql);
    }
    _closeDB();
    print("buildNotePages() <-");
    return newGuid;
  }

  createTable(String tableName, List<TableField> fieldList,
      {String stDBName = "fonote.db"}) async {
    // Database db = await getCurrentDatabase(stDBName);
    // init(stDBName);
    if (!_isOpened()) {
      await _getCurrentDatabase(stDBName: stDBName);
    }
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
    await _database.execute(sql);
    _closeDB();
  }

  getTableNamesFromDB({String stDBName = "fonote.db"}) async {
    if (!_isOpened()) {
      await _getCurrentDatabase(stDBName: stDBName);
    }
    var sql =
        "select name from sqlite_master where type = 'table' and name <> 'android_metadata'";
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
    _closeDB();
    return tableNames;
  }

  Future<bool> _firstTimeisNull(String noteBookName, String notePageID,
      {String stDBName = "fonote.db"}) async {
    if (!_isOpened()) {
      await _getCurrentDatabase(stDBName: stDBName);
    }
    String emptyPageID = await getFirstEmptyPage(noteBookName);
    _closeDB();
    return emptyPageID == notePageID ? true : false;
  }

  Future<String> updataNotePage(String noteBookName, String notePageID,
      {String stDBName = "fonote.db",
      String pageTitle = "",
      String pageMemo = ""}) async {
    if (!_isOpened()) {
      await _getCurrentDatabase(stDBName: stDBName);
    }
    print("updataNotePage() ->");
    String newGuid = "";

    if ((_isOpened()) && (noteBookName != null)) {
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
    _closeDB();
    print("updataNotePage() <-");
    return newGuid;
  }

  Future<bool> isTableExists(String tableName,
      {String stDBName = "fonote.db"}) async {
    if (!_isOpened()) {
      await _getCurrentDatabase(stDBName: stDBName);
    }
    String sql =
        "select * from Sqlite_master where type = 'table' and name = '$tableName' ";
    var res = await _database.rawQuery(sql);
    // bool mret = res != null && res.length > 0;
    // return mret;
    _closeDB();
    return res != null && res.length > 0;
  }

///////////////////////////////////////////////////////////////////
  ///下面是开放给用户调用的函数
// 初始化数据库
  initDB({String stDBName = "fonote.db"}) async {
    var databasePath = await getDatabasesPath();

    stDatabasePath = databasePath + "/" + stDBName;

    _database = await openDatabase(stDatabasePath, version: DB_VERSION,
        onCreate: (Database db, int version) async {
      //如果需要马上创建表,则在这里加入创建表的代码
    });
    // _closeDB();
  }

//在数据库中搜索并返回第一张新的空白页
  Future<String> getEmptyPage(String noteBookName,
      {String stDBName = "fonote.db"}) async {
    String pageID = "";
    if (!_isOpened()) {
      await _getCurrentDatabase(stDBName: stDBName);
    }
    pageID = await getFirstEmptyPage(noteBookName);
    _closeDB();
    return pageID;
  }

  /// 更新给定id的页面内容
  Future<String> updataPage(String noteBookName, String notePageID,
      {String stDBName = "fonote.db",
      String pageTitle = "",
      String pageMemo = ""}) async {
    String pageID = "";
    if (!_isOpened()) {
      await _getCurrentDatabase(stDBName: stDBName);
    }
    pageID = await updataNotePage(noteBookName, notePageID,
        pageTitle: pageTitle, pageMemo: pageMemo);
    _closeDB();
    return pageID;
  }

  /// 创建笔记本，同时创建笔记本中的所有100个空白页面。
  createNoteBook(String noteBookName) async {
    TableFields mt = TableFields();
    mt.addField("id", fieldtype: FieldType.key, isnotnull: true);
    mt.addField("page", fieldtype: FieldType.integer, isnotnull: true);
    mt.addField("topic", fieldtype: FieldType.char, isnotnull: false);
    mt.addField("mainbody", fieldtype: FieldType.text, isnotnull: false);
    mt.addField("create_datetime",
        fieldtype: FieldType.timestamp, isnotnull: false);
    mt.addField("first_datetime",
        fieldtype: FieldType.timestamp_not_now, isnotnull: false);
    mt.addField("last_datetime",
        fieldtype: FieldType.timestamp_not_now, isnotnull: false);

    await createTable(noteBookName, mt.getList());
    for (var i = 1; i <= 100; i++) {
      await buildNotePages(noteBookName, i);
    }
  }
}
