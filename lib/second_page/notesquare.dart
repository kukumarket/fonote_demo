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

class MyNoteSquarePage extends StatelessWidget {
  // Default placeholder text
  // ScrollController _controller = new ScrollController(); // 定义用于笔记本列表的滚动控制器

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("笔记广场"),
        ),
        body: Center(
          // child:
          // GestureDetector(
          // onTap: (){},
          // child: MyNotesArea(),
          // ),
          child: MyNoteSquareArea(),
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

class MyNoteSquareArea extends StatefulWidget {
  @override
  State<MyNoteSquareArea> createState() {
    return new MyNoteSquareAreaState();
  }
}

List<String> _myNotesNamesList = ["添加笔记本"];
bool _canOverLay = false;

class MyNoteSquareAreaState extends State<MyNoteSquareArea> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getMyNoteTitleImage(),
      ],
    );
  }

  // static OverlayEntry _getNotesAddOverlayEntry
}
