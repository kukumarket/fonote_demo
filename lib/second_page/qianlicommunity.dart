// import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fonote_demo/tools/tools.dart';

bool canOverLay = false;

//获取<我的笔记>页面的标题图
Image _getMyNoteTitleImage() {
  return Image.asset("images/index_title.png");
}
// Column buildNoteButtonColumn(BuildContext context, IconData iconData,
//     String label, OverlayEntry overlayEntry) {
//   Color color = Theme.of(context).primaryColor;
//   return new Column(
//     mainAxisSize: MainAxisSize.min,
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       // new Icon(icon, color: color, size: 40),
//       new IconButton(
//           icon: Icon(iconData, color: color, size: 40),
//           // onPressed: callback),
//           onPressed: () => {
//                 print("[$label] 按钮被按下!"),

//                 if (label == "添加笔记本")
//                   {
//                     canOverLay = true,
//                     print("需要进入添加笔记本流程"),
//                     Overlay.of(context).insert(overlayEntry),
//                   }
//                 else
//                   {
//                     print("需要进入调用笔记流程"),
//                   }
//               }),
//       new Container(
//         margin: const EdgeInsets.only(top: 8.0),
//         child: new Text(
//           label,
//           style: new TextStyle(
//             fontSize: 12.0,
//             fontWeight: FontWeight.w400,
//             color: color,
//           ),
//         ),
//       ),
//     ],
//   );
// }

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

Row _getMyNoteColorPanel(BuildContext context) {
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
// child:Text(""),

        child: GestureDetector(
          onTap: () {
            if (canOverLay) {
              _overlayEntry.remove();
              canOverLay = false;
            }
            // try {
            //   //移除提示窗口

            //   if (canOverLay) {
            //     if (_overlayEntry != null) {

            //     } else {
            //       print("is null");
            //     }
            //     ;
            //   }
            // } on Exception catch (e) {
            //   print('Exception details:\n $e');
            // } catch (e, s) {
            //   print('Exception details:\n $e');
            //   print('Stack trace:\n $s');
            // }
          },
          child: Column(
            children: [
// Image.network('https://pic.downk.cc/item/5f3d3b8a14195aa594c00735.png'),
// 读取<我的笔记>页面的标题图
// 标题图不需要响应事件
              _getMyNoteTitleImage(),
// 读取<我的笔记>页面的搜索框
// 搜索框需要响应查找事件
              // _getMyNoteSearchTextField(),

// 读取<我的笔记>页面的笔记本列表
// 此列表中的图标需要响应点击事件

              // _getMyNoteListGrid(context, _controller, _overlayEntry),
              // new MyNotesGrid(_controller, _overlayEntry),
              // new MyNotesGrid(),
              new MyNotesArea(),

// buildNoteRow(Icons.library_books, '我的笔记本'),
              //     buildNoteRow(IconData(0xe632, fontFamily: 'NoteIcons'), "简要使用说明"),
// buildButtonColumn(Icons.call, 'CALL'),
            ],
          ), // ),//
        ),
      ),

//			 floatingActionButton: FloatingActionButton(
// 	onPressed: _addNewNoteBook,
// 	tooltip: 'Increment',
// 	child: Icon(Icons.add),
//			 ),
// This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.print,
                color: Colors.blue,
                size: 30,
              ),
              title: Text("个人笔记")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.print,
                color: Colors.blue,
                size: 30,
              ),
              title: Text("笔记广场")),
          //	 BottomNavigationBarItem(
          //			 icon: Icon(
          // 	Icons.print,
          // 	color: Colors.blue,
          // 	size: 30,
          //			 ),
          //			 title: Text("添加")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.print,
                color: Colors.blue,
                size: 30,
              ),
              title: Text("千里笔记")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.print,
                color: Colors.blue,
                size: 30,
              ),
              title: Text("我的")),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  // Expanded _getMyNoteListGrid(BuildContext context,
  //     ScrollController _controller, OverlayEntry _overlayentry) {
  //   return Expanded(
  //     child: GridView(
  //         primary: false,
  //         shrinkWrap: true,
  //         scrollDirection: Axis.vertical,
  //         controller: _controller, // 设置控制器
  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //             crossAxisCount: 4, //横轴三个子widget
  //             childAspectRatio: 1.0 //宽高比为1时，子widget
  //             ),
  //         children: <Widget>[
  //           //首先添加 简要使用说明
  //           buildNoteButtonColumn(
  //               context,
  //               IconData(0xe632, fontFamily: 'NoteIcons'),
  //               "简要使用说明",
  //               _overlayentry),
  //           //中间添加其他笔记本
  //           buildNoteButtonColumn(
  //               context,
  //               IconData(0xe600, fontFamily: 'NoteIcons'),
  //               "其他笔记本",
  //               _overlayentry),

  //           //最后添加 添加笔记本的入口图标
  //           buildNoteButtonColumn(
  //               context,
  //               IconData(0xe722, fontFamily: 'NoteIcons'),
  //               "添加笔记本",
  //               _overlayentry),

  //           //     Icon(Icons.ac_unit,size:40),
  //           //     Icon(Icons.airport_shuttle,size:40),
  //           //     Icon(Icons.all_inclusive,size:40),
  //           //     Icon(Icons.beach_access,size:40),
  //           //     Icon(Icons.cake,size:40),
  //           //     Icon(Icons.free_breakfast,size:40)
  //         ]),
  //   );
  // }
}

TextField _getMyNoteTextField(
    String hintStr, String labelStr, OverlayEntry overlayEntry) {
  return TextField(
    // autofocus: true,
    cursorColor: Colors.deepOrange,
    cursorRadius: Radius.circular(20.0),
    cursorWidth: 20.0,
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
      hintText: hintStr,
      labelText: labelStr,
    ),
    onSubmitted: (text) {
      if (overlayEntry != null) {
        overlayEntry.remove();
        canOverLay = false;
      }
      if (text != "") {
        print("已提交了创建笔记本<$text>的请求. 检测是否可以创建对应名称的笔记本.");
        // _myNotesNamesList.add

      }
    },
  );
}

OverlayEntry _overlayEntry = _getNotesAddOverlayEntry();
OverlayEntry _getNotesAddOverlayEntry() {
  return new OverlayEntry(builder: (context) {
    var screenSize = window.physicalSize; //屏幕分辨率
    var screenPixelRatio = MediaQuery.of(context).devicePixelRatio;
    print("屏幕尺寸为 $screenSize"); //输出屏幕尺寸
    print("屏幕像素密度为 $screenPixelRatio"); //输出像素密度
    // print(screenSize.width / screenPixelRatio);
    // print(screenSize.height / screenPixelRatio);
    return
        // new Positioned(
        // //   top: MediaQuery.of(context).size.height * 0.8,
        // top: (screenSize.height / 2) / 2.625,
        // child:
        new Center(
      child: GestureDetector(
        // onTap: () {
        //   print("触碰了card.");
        // },
        child: new Container(
          width: screenSize.width / screenPixelRatio * 0.95,
          height: screenSize.height / screenPixelRatio * 0.25,
          child: new Card(
            child: new Padding(
              padding: EdgeInsets.all(8),
              //   child: new Text("添加笔记本的弹窗"),
              child: new Column(
                children: [
                  //文本录入行
                  _getMyNoteTextField("请在这里输入新笔记本的名字。", "创建笔记本", _overlayEntry),
                  _getMyNoteColorPanel(context),
                ],
              ),
            ),
            color: Colors.green[100],
          ),
        ),
      ),
      //   ),
    );
  });
}

//下面的代码，定义了一个MyNotesGrid类
//这个类用于显示笔记本的列表
//在添加/删除了笔记本，或者对笔记本名进行了重命名操作后，更新状态。
class MyNotesGrid extends StatefulWidget {
  // MyNotesGrid(Key key,this.controller,this.overlayentry):super(key:key);
  // MyNotesGrid(this.controller, this.overlayentry) : super();

  MyNotesGrid() : super();
  //需要从外部传递进来的变量?
  // final ScrollController controller;

  @override
  // _MyNotesGridState createState() => new _MyNotesGridState(controller,overlayentry);
  _MyNotesGridState createState() => new _MyNotesGridState(_overlayEntry);
}

class _MyNotesGridState extends State<MyNotesGrid> {
  // _MyNotesGridState(this.controller,this.overlayentry) : super();
  _MyNotesGridState(this.overlayentry) : super();
  // OverlayEntry _overlayentry;
  // final ScrollController controller;
  final ScrollController _controller =
      new ScrollController(); // 定义用于笔记本列表的滚动控制器
  final OverlayEntry overlayentry;
  List<String> _myNotesNamesList = ["添加笔记本"];
  // List<Widget> _myNotes = new List();

  // get _getNotesList => null;
  List<Widget> _getNotesList() {
    return _myNotesNamesList.map((item) {
      // print(item);

      if (item == "添加笔记本") {
        return _buildNoteButtonColumn(context,
            IconData(0xe722, fontFamily: 'NoteIcons'), item, overlayentry);
      } else {
        return //   //首先添加 简要使用说明
            _buildNoteButtonColumn(context,
                IconData(0xe632, fontFamily: 'NoteIcons'), item, overlayentry);
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        controller: _controller, // 设置控制器
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, //横轴三个子widget
            childAspectRatio: 1.0 //宽高比为1时，子widge
            ),
        children: _getNotesList(),
        // children: <Widget>[

        //   //首先添加 简要使用说明
        //   buildNoteButtonColumn(
        //       context,
        //       IconData(0xe632, fontFamily: 'NoteIcons'),
        //       "简要使用说明",
        //       overlayentry),
        //   //中间添加其他笔记本
        //   buildNoteButtonColumn(
        //       context,
        //       IconData(0xe600, fontFamily: 'NoteIcons'),
        //       "其他笔记本",
        //       overlayentry),

        //   //最后添加 添加笔记本的入口图标
        //   buildNoteButtonColumn(
        //       context,
        //       IconData(0xe722, fontFamily: 'NoteIcons'),
        //       "添加笔记本",
        //       overlayentry),

        //   //     Icon(Icons.ac_unit,size:40),
        //   //     Icon(Icons.airport_shuttle,size:40),
        //   //     Icon(Icons.all_inclusive,size:40),
        //   //     Icon(Icons.beach_access,size:40),
        //   //     Icon(Icons.cake,size:40),
        //   //     Icon(Icons.free_breakfast,size:40)
        // ]
      ),
    );
  }

  Column _buildNoteButtonColumn(BuildContext context, IconData iconData,
      String item, OverlayEntry overlayentry) {
    Color color = Theme.of(context).primaryColor;
    return new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // new Icon(icon, color: color, size: 40),
        new IconButton(
            icon: Icon(iconData, color: color, size: 40),
            // onPressed: callback),
            onPressed: () => {
                  print("[$item] 按钮被按下!"),
                  if (item == "添加笔记本")
                    {
                      canOverLay = true,
                      print("需要进入添加笔记本流程"),
                      Overlay.of(context).insert(overlayentry),
                    }
                  else
                    {
                      print("需要进入调用笔记流程"),
                    }
                }),
        new Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: new Text(
            item,
            style: new TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class MyNotesArea extends StatefulWidget {
  @override
  State<MyNotesArea> createState() {
    return new MyNotesAreaState();
  }
}

class MyNotesAreaState extends State<MyNotesArea> {
  List<String> _myNotesNamesList = ["添加笔记本"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getTextField("请输入笔记本名或者它的一部分。", "查找笔记本", _findNoteBook),
        getNoteBookGrid(),
      ],
    );
  }

  //根据给定的笔记本名,查找笔记本的逻辑
  void _findNoteBook(String noteBookName) {
    print("尝试查找名字包含<$noteBookName>的笔记本.");
  }

  Expanded getNoteBookGrid() {
    return new Expanded(
      child: GridView(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        controller: new ScrollController(), // 设置控制器
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, //横轴三个子widget
            childAspectRatio: 1.0 //宽高比为1时，子widge
            ),
        // children: _getNoteBooksList(),
        children: <Widget>[
          Text(""),
          Text(""),
          Text(""),
          Text(""),
          Text(""),
          Text(""),
          Text(""),
          Text(""),
        ],
      ),
    );
  }
}
