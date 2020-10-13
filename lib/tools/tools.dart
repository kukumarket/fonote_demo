// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class GlobalValues {
  static String currNoteBookName;
  static String currNoteBookPageID;
  static String currNoteBookTitle;
  static String currNoteBookMemo;
  static double screenWidth;
  static double screenHeight;
  static double screenPixelRatio;
}

class GlobalDefines {
  static final String noteDB = "fonote.db";
}

class UidTool {
  static final uuid = Uuid();
  static String getuuid() {
    String stUUid = uuid.v4().toString().toUpperCase();
    return stUUid;
  }
}

BottomNavigationBarItem getBottomNavigationBar(
    IconData iconData, Color color, double size, String title) {
  return BottomNavigationBarItem(
      icon: Icon(
        iconData,
        color: color,
        size: size,
      ),
      title: Text("$title"));
}

Widget getListItem(String title, String subTitle, IconData icon,
    void Function() notetoeditcallback) {
  return Container(
    child: ListTile(
      leading: Icon(icon, size: 40),
      // trailing: Icon(icon),
      title: Text(title),
      subtitle: Text(subTitle),
      onTap: () {
        print("笔记$title 被选择.");
        notetoeditcallback();
      },
    ),
  );
}

//获取<我的笔记>页面的标题图
Image getMyNoteTitleImage() {
  return Image.asset("images/index_title.png");
}

Column buildMyNotePageBookColorPanelColumn(
    BuildContext context, IconData iconData, Color iconColor) {
  // Color color = Theme.of(context).primaryColor;
  // Color color = iconColor;
  return new Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      // new Icon(icon, color: color, size: 40),
      new IconButton(
          icon: Icon(iconData, color: iconColor, size: 32),
          // onPressed: callback),
          onPressed: () => {
                print("色彩选择按钮被按下!当前选择的色彩是:" + iconColor.toString()),
                // if (label == "添加笔记本")
                //   {
                //     print("需要进入添加笔记本流程"),
                //     Overlay.of(context).insert(overlayEntry),
                //     new Future.delayed(Duration(seconds: 5))
                //         .then((value) => overlayEntry.remove())
                //   }
                // else
                //   {
                //     print("需要进入调用笔记流程"),
                //   }
              }),
      // new Container(
      //   margin: const EdgeInsets.only(top: 8.0),
      //   child: new Text(
      //     label,
      //     style: new TextStyle(
      //       fontSize: 12.0,
      //       fontWeight: FontWeight.w400,
      //       color: color,
      //     ),
      //   ),
      // ),
    ],
  );
}

Row getMyNoteColorPanel(BuildContext context) {
  return new Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      buildMyNotePageBookColorPanelColumn(
          context, IconData(0xe650, fontFamily: 'NoteIcons'), Colors.red[300]),
      buildMyNotePageBookColorPanelColumn(
          context, IconData(0xe650, fontFamily: 'NoteIcons'), Colors.blue[300]),
      buildMyNotePageBookColorPanelColumn(context,
          IconData(0xe650, fontFamily: 'NoteIcons'), Colors.yellow[300]),
      buildMyNotePageBookColorPanelColumn(context,
          IconData(0xe650, fontFamily: 'NoteIcons'), Colors.green[300]),
      buildMyNotePageBookColorPanelColumn(context,
          IconData(0xe650, fontFamily: 'NoteIcons'), Colors.orange[300]),
      buildMyNotePageBookColorPanelColumn(context,
          IconData(0xe650, fontFamily: 'NoteIcons'), Colors.purple[300]),
    ],
  );
}

TextField getTextField(
    String hintStr, String labelStr, void Function(String) txtCallback) {
  return TextField(
    // autofocus: true,
    cursorColor: Colors.deepOrange,
    cursorRadius: Radius.circular(20.0),
    cursorWidth: 10.0,
    maxLength: 20,
    // keyboardType:TextInputType.text,
    decoration: InputDecoration(
      // icon: Icon(Icons.supervised_user_circle),
      suffixIcon: Icon(Icons.search, size: 30),
      //文本内容的内边距
      contentPadding: EdgeInsets.all(10.0),
      // 圆角矩形的输入框样式
      border: OutlineInputBorder(
          // 圆角半径 10
          borderRadius: BorderRadius.circular(10.0)),
      // helperText: "请输入笔记本名称",
      // hintText: "请输入笔记本名或者它的一部分。",
      // labelText: "查找笔记本",
      hintText: hintStr,
      labelText: labelStr,
    ),

    //从外部传进提交文本之后的处理事件
    onSubmitted: txtCallback,
  );
}

List<BottomNavigationBarItem> getBottomNavigation() {
  List<BottomNavigationBarItem> mBottomNavigationList = [
    getBottomNavigationBar(Icons.print, Colors.blue, 30, "个人笔记"),
    getBottomNavigationBar(Icons.print, Colors.blue, 30, "笔记广场"),
    getBottomNavigationBar(Icons.print, Colors.blue, 30, "千里官宣"),
    getBottomNavigationBar(Icons.print, Colors.blue, 30, "我的"),
    getBottomNavigationBar(Icons.print, Colors.blue, 30, "测试页")
  ];
  return mBottomNavigationList;
}

BottomNavigationBar getBottomToolBar(BuildContext context) {
  return BottomNavigationBar(
    onTap: (value) {
      print("bottomnavigation click : $value");
      if (value == 0) {
        Navigator.of(context).pushNamed('/page1');
      } else if (value == 1) {
        Navigator.of(context).pushNamed('/page4');
      } else if (value == 2) {
        Navigator.of(context).pushNamed('/page5');
      } else if (value == 3) {
        Navigator.of(context).pushNamed('/page6');
      } else if (value == 4) {
        Navigator.of(context).pushNamed('/page13');
      }
    },
    items: getBottomNavigation(),
    type: BottomNavigationBarType.fixed,
  );
}

ListTile getMyInfoListTitle(
    IconData iconData, String title, BuildContext context, String goPage) {
  return ListTile(
    leading: Icon(iconData, size: 32),
    title: Text(
      title,
      style: TextStyle(fontSize: 24),
    ),
    trailing: Icon(IconData(0xe7eb, fontFamily: 'NoteIcons'), size: 32),
    onTap: () {
      print("click title = $title");
      Navigator.of(context).pushNamed(goPage);
    },
    isThreeLine: false,
    enabled: true,
  );
}
