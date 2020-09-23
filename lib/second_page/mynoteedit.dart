// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fonote_demo/tools/tools.dart';

class MyNoteEditPage extends StatelessWidget {
  // Default placeholder text
  // ScrollController _controller = new ScrollController(); // 定义用于笔记本列表的滚动控制器

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(IconData(0xe632, fontFamily: 'NoteIcons'), size: 32),
        title: Text("笔记编辑页面"),
        actions: <Widget>[
          IconButton(
            icon: Icon(IconData(0xe603, fontFamily: 'NoteIcons'), size: 32),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(IconData(0xe662, fontFamily: 'NoteIcons'), size: 32),
            onPressed: () {},
          )
        ],
      ),
      body: MyNoteEditArea(),
      // body: Container(
      //   // child:
      //   // GestureDetector(
      //   // onTap: (){},
      //   // child: MyNotesArea(),
      //   // ),
      //   child: (),
      // ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     print("需要添加新的笔记内容。尝试跳转到页面");
      //   },
      //   tooltip: '添加新的笔记',
      //   child: Icon(Icons.add),
      // ),
      // This trailing comma makes auto-formatting nicer for build methods.

      bottomNavigationBar: BottomNavigationBar(
        items: [
          getBottomNavigationBar(Icons.print, Colors.blue, 30, "个人笔记"),
          getBottomNavigationBar(Icons.print, Colors.blue, 30, "笔记广场"),
          getBottomNavigationBar(Icons.print, Colors.blue, 30, "千里官宣"),
          getBottomNavigationBar(Icons.print, Colors.blue, 30, "我的"),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

//////////////////////////////////////////
///
///

class MyNoteEditArea extends StatefulWidget {
  @override
  State<MyNoteEditArea> createState() {
    return new MyNoteEditState();
  }
}

class MyNoteEditState extends State<MyNoteEditArea> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(),
        Expanded(
          // padding: EdgeInsets.all(8.0),
          child: TextField(
            maxLines: 36,
          ),
        ),
      ],
    );
  }
}
