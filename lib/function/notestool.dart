// 此文件用于处理笔记文档相关的功能。
// 此文件调用dbmanager中的函数来实现相关功能。
import 'package:fonote_demo/db/dbmanager.dart';
import 'package:fonote_demo/tools/tools.dart';

// CREATE TABLE student(
//    ID INT PRIMARY KEY     NOT NULL,
//    NAME           TEXT    NOT NULL,
//    AGE            INT     NOT NULL,
//    ADDRESS        CHAR(50),
//    FEES         REAL
// );
// //原文出自【易百教程】，商业转载请联系作者获得授权，非商业请保留原文链接：https://www.yiibai.com/sqlite/create-table.html

enum FieldType { key, text, integer, real, char, timestamp, timestamp_not_now }

class TableFields {
  List<TableField> mFields = [];
  addField(String fname,
      {FieldType fieldtype = FieldType.char,
      int fieldlength = 20,
      bool isnotnull = false}) {
    TableField mField = TableField();
    mField.setfield(fname,
        fieldtype: fieldtype, fieldlength: fieldlength, isnotnull: isnotnull);
    mFields.add(mField);
  }

  List<TableField> getList() {
    return mFields;
  }
}

class TableField {
  void setfield(String fname,
      {FieldType fieldtype = FieldType.char,
      int fieldlength = 20,
      bool isnotnull = false}) {
    this.fieldType = fieldtype;
    this.fieldLength = fieldlength;
    this.notNull = isnotnull;
    this.fieldName = fname;
  }

  FieldType fieldType;
  int fieldLength;
  bool notNull;
  String fieldName;
}

///
/*
 * 这是用于处理笔记本相关操作的工具类.
 * 
 *  * 函数1 [createNoteBook]在数据库中创建笔记本
 *   * 参数1 [noteBookName]用户提供的笔记本名
 * 
 * [示例代码]
 * ```dart
 *  //调用createNoteBook方法以创建新的笔记本
 *    await NotesTool.createNoteBook(noteBookName);
 *  
 ```
 *  * 参数2 
 *  */

class NotesTool {
  // CreateNoteBook方法用于创建笔记本
  static createNoteBook(String noteBookName) async {
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

    await DBManager.createTable(
        GlobalDefines.noteDB, noteBookName, mt.getList());
    for (var i = 1; i <= 100; i++) {
      await DBManager.buildNotePages(noteBookName, i);
    }
    // await DBManager.buildNotePages(noteBookName, 1);
    // await DBManager.buildNotePages(noteBookName, 2);
    // await DBManager.buildNotePages(noteBookName, 3);
    // await DBManager.buildNotePages(noteBookName, 4);
    // await DBManager.buildNotePages(noteBookName, 5);
  }

  ///CreatePage 方法用于在笔记本中创建页面
  ///这个方法需要传递笔记本名作为必要参数
  ///在本程序中，数据库名默认存放于 noteDB 变量
  ///此方法实质是在给定数据表中插入一条记录。
  ///此方法返回新生成的记录的主键
  ///此主键用于识别笔记本中的单条笔记
  ///生成新笔记的记录时，自动生成主键
  static Future<String> createPage(String noteBookName) async {
    String mret = await DBManager.getFirstEmptyPage(noteBookName);
    if (mret != "") {
      print("在笔记本：$noteBookName 中查找第一个可用页面。其标志为: $mret");
    }
    return mret;
  }

  //OpenPage 方法用于打开一个指定的页面
  static Future<String> openPage(String noteBookID) async {
    return "";
  }

  //GetNoteBooks()方法用于返回一个List<String>类型的笔记本列表
  static Future<List<String>> getNoteBooks() async {
    return [];
  }

  //GetPages()方法用于返回一个List<NotePage>类型的页面列表
  static Future<List<String>> getPages() async {
    return [];
  }
}
