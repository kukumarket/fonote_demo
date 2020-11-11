// import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fonote_demo/compentlib/compentlib-001.dart';
import 'package:fonote_demo/compentlib/compentlib-003.dart';
import 'package:fonote_demo/compentlib/compentlib-004.dart';

class Clib018005003ColorSelectButtons {
  Clib008003002IconButton clib008003002iconButton = Clib008003002IconButton();
  Clib017004001IconData clib017004001iconData = Clib017004001IconData();
  Widget getWidget() {
    void onSelectRed() {}
    void onSelectOrange() {}
    void onSelectYellow() {}
    void onSelectGreen() {}
    void onSelectYuanWeiLan() {}
    void onSelectBiQing() {}
    return Row(
      children: [
        clib008003002iconButton.getWidget(
          clib017004001iconData.getWidget(color: Colors.red),
          onSelectRed,
        ),
        clib008003002iconButton.getWidget(
          clib017004001iconData.getWidget(color: Colors.orange),
          onSelectOrange,
        ),
        clib008003002iconButton.getWidget(
          clib017004001iconData.getWidget(color: Colors.yellow),
          onSelectYellow,
        ),
        clib008003002iconButton.getWidget(
          clib017004001iconData.getWidget(color: Colors.green),
          onSelectGreen,
        ),
        clib008003002iconButton.getWidget(
          clib017004001iconData.getWidget(
              color: Color.fromARGB(255, 92, 179, 204)),
          onSelectBiQing,
        ),
        clib008003002iconButton.getWidget(
          clib017004001iconData.getWidget(
              color: Color.fromARGB(255, 21, 139, 184)),
          onSelectYuanWeiLan,
        ),
      ],
    );
  }
}

OverlayEntry _overlayEntry = OverlayEntry(
  builder: (context) {
    // var screenSize = window.physicalSize; //屏幕分辨率
    // var screenPixelRatio = MediaQuery.of(context).devicePixelRatio;
    // GlobalValues.screenPixelRatio = screenPixelRatio;
    // // print("屏幕尺寸为 $screenSize"); //输出屏幕尺寸
    // // print("屏幕像素密度为 $screenPixelRatio"); //输出像素密度

    void _createNoteBook(String noteBookName) {
      print("尝试创建$noteBookName");
      if (noteBookName != "") {
        // if (myNotesNamesList.indexOf(noteBookName) >= 0) {
        //   print("已存在同名笔记本，无法继续添加");
        // } else {
        //   newBook(noteBookName);

        //   //添加笔记本名到列表
        //   myNotesNamesList.add(noteBookName);
        //   // setState(() {});
        //   Navigator.of(context).pushNamed('/page1');
        //   // _setNoteBookState();

        // }
      }
      // _canOverLay = false;
      _overlayEntry.remove();
    }

    Clib002001001SearchTextField clib002001001searchTextField =
        Clib002001001SearchTextField();
    return new Center(
      child: GestureDetector(
        child: new Container(
          // width: screenParameter.width / screenParameter.pixelration * 0.95,
          // height: screenParameter.height / screenParameter.pixelration * 0.25,
          child: new Card(
            child: new Padding(
              padding: EdgeInsets.all(8),
              child: new Column(
                children: [
                  // getTextField("请在这里输入新笔记本的名字。", "创建笔记本", _createNoteBook),
                  clib002001001searchTextField.getWidget(
                      "请在这里输入新笔记本的名字。", "创建笔记本", _createNoteBook, 10),
                  // getMyNoteColorPanel(context),
                ],
              ),
            ),
            color: Colors.green[100],
          ),
        ),
      ),
    );
  },
);
