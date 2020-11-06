import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fonote_demo/compentlib/compentlib-001.dart';
import 'package:fonote_demo/tools/tools.dart';
import 'package:fonote_demo/compentlib/compentlib-003.dart';

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
          onPressed: () {},
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
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

List<String> _myNotesNamesList = [];
bool _canOverLay = false;

class MyNotesAreaState extends State<MyNotesArea> {
  static OverlayEntry _overlayEntry = OverlayEntry(
    builder: (context) {
      var screenSize = window.physicalSize; //屏幕分辨率
      var screenPixelRatio = MediaQuery.of(context).devicePixelRatio;
      print("屏幕尺寸为 $screenSize"); //输出屏幕尺寸
      print("屏幕像素密度为 $screenPixelRatio"); //输出像素密度

// print(screenSize.width / screenPixelRatio);
// print(screenSize.height / screenPixelRatio);
      void _createNoteBook(String noteBookName) {
        print("尝试创建$noteBookName");
        if (noteBookName != "") {
          if (_myNotesNamesList.indexOf(noteBookName) >= 0) {
            print("已存在同名笔记本，无法继续添加");
          } else {
            _myNotesNamesList.add(noteBookName);
            //setState((){});
            Navigator.of(context).pushNamed('/page1');
            // _setNoteBookState();

          }
        }
        _overlayEntry.remove();
      }

      WidgetLibLevel001SearchTextField widgetLibLevel001SearchTextField =
          new WidgetLibLevel001SearchTextField();
      return
// new Positioned(
// //	 top: MediaQuery.of(context).size.height * 0.8,
// top: (screenSize.height / 2) / 2.625,
// child:
          new Center(
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
//	 ),
      );
    },
  );

  //根据给定的笔记本名,查找笔记本的逻辑
  void _findNoteBook(String noteBookName) {
    print("尝试查找名字包含<$noteBookName>的笔记本.");
  }

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

  // void _setNoteBookState() {
  //   setState(() {});
  // }
  WidgetLibLevel001SearchTextField widgetLibLevel001SearchTextField =
      new WidgetLibLevel001SearchTextField();

  WidgetLibLevel001TitleImage widgetLibLevel001TitleImage =
      new WidgetLibLevel001TitleImage();
  CompentsLibLevel001NoteBooks compentsLibLevel001NoteBooks =
      CompentsLibLevel001NoteBooks();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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

  //////////////////////////////////////////////

  // Column _buildNoteButtonColumn(IconData iconData, String item) {
  //   Color color = Theme.of(context).primaryColor;
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       // new Icon(icon, color: color, size: 40),
  //       new IconButton(
  //           icon: Icon(iconData, color: color, size: 40),
  //           // onPressed: callback),
  //           onPressed: () => {
  //                 print("[$item] 按钮被按下!_canOverLay is $_canOverLay"),
  //                 if (item == "添加笔记本")
  //                   {
  //                     _canOverLay = true,
  //                     print("需要进入添加笔记本流程"),
  //                     Overlay.of(context).insert(_overlayEntry),
  //                   }
  //                 else
  //                   {
  //                     print("需要进入调用笔记流程"),
  //                     Navigator.of(context).pushNamed('/page2'),
  //                   }
  //               }),
  //       new Container(
  //         margin: const EdgeInsets.only(top: 8.0),
  //         child: Text(
  //           item,
  //           style: TextStyle(
  //             fontSize: 12.0,
  //             fontWeight: FontWeight.w400,
  //             color: color,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // //返回笔记本列表
  // List<Widget> _getNoteBooksList() {
  //   return _myNotesNamesList.map((item) {
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

  // //获得笔记本网格组件
  // Expanded getNoteBookGrid() {
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
  //         children: _getNoteBooksList(),
  //       ),
  //     ),
  //   );
  // }

  // Expanded getNotesGrid() {
  //   return Expanded(
  //     child: GestureDetector(
  //       child: GridView(
  //         primary: false,
  //         shrinkWrap: true,
  //         scrollDirection: Axis.vertical,
  //         controller: ScrollController(), // 设置控制器
  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //             crossAxisCount: 4, //横轴三个子widget
  //             childAspectRatio: 1.0 //宽高比为1时，子widge
  //             ),
  //       ),
  //     ),
  //   );
  // }

  // static OverlayEntry _getNotesAddOverlayEntry
}
