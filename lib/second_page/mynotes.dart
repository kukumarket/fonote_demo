import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fonote_demo/tools/tools.dart';
import 'package:fonote_demo/db/dbmanager.dart';
import 'package:fonote_demo/function/notestool.dart';
import 'package:fonote_demo/compentlib/compentlib-001.dart';
import 'package:fonote_demo/compentlib/compentlib-003.dart';

////////////////////////////////

bool _canOverLay = false;

void newBook(String noteBookName) async {
  await DBManager.init(GlobalDefines.noteDB);
  bool isTableExits =
      await DBManager.isTableExists(GlobalDefines.noteDB, noteBookName);
  if (!isTableExits) {
    print("没有同名笔记本，允许建立笔记本 $noteBookName。");
    await NotesTool.createNoteBook(noteBookName);
  }
  DBManager.close();
}

OverlayEntry _overlayEntry = OverlayEntry(
  builder: (context) {
    var screenSize = window.physicalSize; //屏幕分辨率
    var screenPixelRatio = MediaQuery.of(context).devicePixelRatio;
    GlobalValues.screenPixelRatio = screenPixelRatio;
    print("屏幕尺寸为 $screenSize"); //输出屏幕尺寸
    print("屏幕像素密度为 $screenPixelRatio"); //输出像素密度

    void _createNoteBook(String noteBookName) {
      print("尝试创建$noteBookName");
      if (noteBookName != "") {
        if (myNotesNamesList.indexOf(noteBookName) >= 0) {
          print("已存在同名笔记本，无法继续添加");
        } else {
          newBook(noteBookName);

          //添加笔记本名到列表
          myNotesNamesList.add(noteBookName);
          // setState(() {});
          Navigator.of(context).pushNamed('/page1');
          // _setNoteBookState();

        }
      }
      _canOverLay = false;
      _overlayEntry.remove();
    }

    WidgetLibLevel001SearchTextField widgetLibLevel001SearchTextField =
        WidgetLibLevel001SearchTextField();
    return new Center(
      child: GestureDetector(
        child: new Container(
          width: screenSize.width / screenPixelRatio * 0.95,
          height: screenSize.height / screenPixelRatio * 0.25,
          child: new Card(
            child: new Padding(
              padding: EdgeInsets.all(8),
              child: new Column(
                children: [
                  // getTextField("请在这里输入新笔记本的名字。", "创建笔记本", _createNoteBook),
                  widgetLibLevel001SearchTextField.getWidget(
                      "请在这里输入新笔记本的名字。", "创建笔记本", _createNoteBook, 10),
                  getMyNoteColorPanel(context),
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

////////////////////////////////
class MyNotePage extends StatelessWidget {
  // Default placeholder text
  // ScrollController _controller = new ScrollController(); // 定义用于笔记本列表的滚动控制器

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        // 	title: Text("个人笔记 - 我的笔记本"),
        // ),
        body: Center(
          // child:
          // GestureDetector(
          // onTap: (){},
          // child: MyNotesArea(),
          // ),
          child: MyNotesArea(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_canOverLay == false) {
              _canOverLay = true;
              print("需要进入添加笔记本流程");
              Overlay.of(context).insert(_overlayEntry);
            }
          },
          tooltip: '添加笔记本',
          child: Icon(
            Icons.note_add,
            size: 40,
          ),
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        // This trailing comma makes auto-formatting nicer for build methods.
        bottomNavigationBar: getBottomToolBar(context));
  }
}

//////////////////////////////////////////
///
///

class MyNotesArea extends StatefulWidget {
  @override
  State<MyNotesArea> createState() {
    return new MyNotesAreaState();
  }
}

class MyNotesAreaState extends State<MyNotesArea> {
  //根据给定的笔记本名,查找笔记本的逻辑
  void _findNoteBook(String noteBookName) {
    print("尝试查找名字包含<$noteBookName>的笔记本.");
  }

  // void _setNoteBookState() {
  //   setState(() {});
  // }
  Function onPressedCallback() {
    print(GlobalValues.currNoteBookName + "按钮被按下!_canOverLay is $_canOverLay");
    print("需要进入调用笔记流程");
    Navigator.of(context).pushNamed('/page2');
    return null;
  }

  Function onTapCallback() {
    print("_canOverLay is $_canOverLay");
    if (_canOverLay) {
      _overlayEntry.remove();
      _canOverLay = false;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    //getNoteNames();
    WidgetLibLevel001TitleImage widgetLibLevel001TitleImage =
        WidgetLibLevel001TitleImage();

    WidgetLibLevel001SearchTextField widgetLibLevel001SearchTextField =
        WidgetLibLevel001SearchTextField();

    CompentsLibLevel001NoteBooks compentsLibLevel001NoteBooks =
        CompentsLibLevel001NoteBooks();

    return Column(
      children: [
        // getMyNoteTitleImage(),
        widgetLibLevel001TitleImage.getWidget(),
        // getTextField("请输入笔记本名或者它的一部分。", "查找笔记本", _findNoteBook),
        widgetLibLevel001SearchTextField.getWidget(
            "请输入笔记本名或者它的一部分。", "查找笔记本", _findNoteBook, 10),
        // getNotesGrid(),
        compentsLibLevel001NoteBooks.getWidget(
            onPressedCallback, onTapCallback),

        // getNoteBookGrid(),
      ],
    );
  }

  // void test(String item) async {
  //   await DBManager.init(noteDB);
  //   await DBManager.countPage(item);
  //   await DBManager.close();
  // }

  // Column _buildNoteButtonColumn(IconData iconData, String item) {
  //   Color color = Theme.of(context).primaryColor;
  //   Function onPressedCallback() {
  //     print(
  //         GlobalValues.currNoteBookName + "按钮被按下!_canOverLay is $_canOverLay");
  //     print("需要进入调用笔记流程");
  //     Navigator.of(context).pushNamed('/page2');
  //     return null;
  //   }

  //   WidgetLibLevel002IconButton widgetLibLevel002IconButton =
  //       WidgetLibLevel002IconButton();

  //   return widgetLibLevel002IconButton.getWidget(iconData, onPressedCallback,
  //       iconcolor: color, caption: item);
  // }

  // //返回笔记本列表
  // List<Widget> _getNoteBooksList() {
  //   return myNotesNamesList.map((item) {
  //     print(item);

  //     if (item == "添加笔记本") {
  //       return _buildNoteButtonColumn(
  //           IconData(0xe722, fontFamily: 'NoteIcons'), item);
  //     } else {
  //       return _buildNoteButtonColumn(
  //           IconData(0xe632, fontFamily: 'NoteIcons'), item);
  //     }
  //   }).toList();
  // }

  // Expanded getNotesGrid() {
  //   WidgetLibLevel003NoteBooks widgetLibLevel003NoteBooks =
  //       WidgetLibLevel003NoteBooks();

  //   Function onPressedCallback() {
  //     print(
  //         GlobalValues.currNoteBookName + "按钮被按下!_canOverLay is $_canOverLay");
  //     print("需要进入调用笔记流程");
  //     Navigator.of(context).pushNamed('/page2');
  //     return null;
  //   }

  //   return Expanded(
  //     child: GestureDetector(
  //       onTap: () {
  //         print("_canOverLay is $_canOverLay");
  //         if (_canOverLay) {
  //           _overlayEntry.remove();
  //           _canOverLay = false;
  //         }
  //       },
  //       child: GridView(
  //         primary: false,
  //         shrinkWrap: true,
  //         scrollDirection: Axis.vertical,
  //         controller: ScrollController(), // 设置控制器
  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //             crossAxisCount: 4, //横轴三个子widget
  //             childAspectRatio: 1.0 //宽高比为1时，子widge
  //             ),
  //         // children: _getNoteBooksList(),
  //         children: widgetLibLevel003NoteBooks.getWidget(
  //             myNotesNamesList, onPressedCallback),
  //       ),
  //     ),
  //   );
  // }

  // static OverlayEntry _getNotesAddOverlayEntry
}
