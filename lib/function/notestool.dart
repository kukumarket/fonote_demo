// 此文件用于处理笔记文档相关的功能。
// 此文件调用dbmanager中的函数来实现相关功能。
import 'package:fonote_demo/db/dbmanager.dart';

final String noteDB = "fonote.db";
// CREATE TABLE student(
//    ID INT PRIMARY KEY     NOT NULL,
//    NAME           TEXT    NOT NULL,
//    AGE            INT     NOT NULL,
//    ADDRESS        CHAR(50),
//    FEES         REAL
// );
// //原文出自【易百教程】，商业转载请联系作者获得授权，非商业请保留原文链接：https://www.yiibai.com/sqlite/create-table.html

enum FieldType { key, text, integer, real, char, timestamp }

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

class NotesTool {
  // CreateNoteBook方法用于创建笔记本
  static createNoteBook(String noteBookName) async {
    TableFields mt = TableFields();
    mt.addField("id", fieldtype: FieldType.key, isnotnull: true);
    mt.addField("page", fieldtype: FieldType.integer, isnotnull: true);
    mt.addField("topic", fieldtype: FieldType.char, isnotnull: false);
    mt.addField("mainbody", fieldtype: FieldType.text, isnotnull: false);
    mt.addField("crdatetime", fieldtype: FieldType.timestamp, isnotnull: false);

    await DBManager.createTable(noteDB, noteBookName, mt.getList());
  }

  //CreatePage 方法用于在笔记本中创建页面
  static Future<String> createPage(String noteBookName) async {}

  //OpenPage 方法用于打开一个指定的页面
  static Future<String> openPage(String noteBookID) async {}

  //GetNoteBooks()方法用于返回一个List<String>类型的笔记本列表
  static Future<List<String>> getNoteBooks() async {}

  //GetPages()方法用于返回一个List<NotePage>类型的页面列表
  static Future<List<String>> getPages() async {}
}
