const int DB_VERSION = 1;

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
