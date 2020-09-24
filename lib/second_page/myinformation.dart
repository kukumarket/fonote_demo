import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fonote_demo/tools/tools.dart';

////////////////////////////////
///
///
///
///
///
///

class MyInfomationPage extends StatelessWidget {
  // Default placeholder text
  // ScrollController _controller = new ScrollController(); // 定义用于笔记本列表的滚动控制器

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("千里社区"),
        // ),
        body: Center(
          // child:
          // GestureDetector(
          // onTap: (){},
          // child: MyNotesArea(),
          // ),
          child: MyInfomationArea(),
        ),

        //floatingActionButton:
        //	FloatingActionButton
        //	(
        //		onPressed: _addNewNoteBook,
        //		tooltip: 'Increment',
        //		child: Icon(Icons.add),
        //	),
        // This trailing comma makes auto-formatting nicer for build methods.
        bottomNavigationBar: getBottomToolBar(context));
  }
}

//////////////////////////////////////////
///
///

class MyInfomationArea extends StatefulWidget {
  @override
  State<MyInfomationArea> createState() {
    return new MyInfomationAreaState();
  }
}

class MyInfomationAreaState extends State<MyInfomationArea> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [getMyNoteTitleImage(), Expanded(child: _getPublicNoteList())],
    );
    // Center(
    //     child: );
  }

  ListView _getPublicNoteList() {
    return ListView(
      itemExtent: 80.0,
      children: [
        getMyInfoListTitle(IconData(0xe60b, fontFamily: 'NoteIcons'), "修改信息"),
        getMyInfoListTitle(IconData(0xe66d, fontFamily: 'NoteIcons'), "密码设置"),
        getMyInfoListTitle(IconData(0xe6aa, fontFamily: 'NoteIcons'), "请我们喝汽水"),
        getMyInfoListTitle(IconData(0xe633, fontFamily: 'NoteIcons'), "回收站"),
        getMyInfoListTitle(IconData(0xe63e, fontFamily: 'NoteIcons'), "意见反馈"),
        getMyInfoListTitle(
            IconData(0xe6b5, fontFamily: 'NoteIcons'), "版权及免责声明"),
      ],
    );
  }

  void _onnoteedit() {
    //该函数被调用时, 使用此函数作为参数的函数中, 应当已经做了处理
    //比如确认是哪个按钮被按下flu
    // setState((){});
  }
  // static OverlayEntry _getNotesAddOverlayEntry
}
