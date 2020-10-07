// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fonote_demo/tools/tools.dart';
import 'package:fonote_demo/db/dbmanager.dart';

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
            onPressed: () {
              print("取消本次编辑，不存盘并返回笔记本封面。");
              Navigator.of(context).pushNamed('/page1');
            },
          ),
          IconButton(
            icon: Icon(IconData(0xe662, fontFamily: 'NoteIcons'), size: 32),
            onPressed: () {
              print("本次编辑需保存，存盘并返回笔记本封面。");
              print("当前笔记本为 " + GlobalValues.currNoteBookName);
              print("当前页面id为 " + GlobalValues.currNoteBookPageID);
              print("当前页面标题为 ");
              print(GlobalValues.currNoteBookTitle);
              print("当前页面正文为 ");
              print(GlobalValues.currNoteBookMemo);
              updataPage(
                  GlobalValues.currNoteBookName,
                  GlobalValues.currNoteBookPageID,
                  GlobalValues.currNoteBookTitle,
                  GlobalValues.currNoteBookMemo);
            },
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

      bottomNavigationBar: getBottomToolBar(context),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     getBottomNavigationBar(Icons.print, Colors.blue, 30, "个人笔记"),
      //     getBottomNavigationBar(Icons.print, Colors.blue, 30, "笔记广场"),
      //     getBottomNavigationBar(Icons.print, Colors.blue, 30, "千里官宣"),
      //     getBottomNavigationBar(Icons.print, Colors.blue, 30, "我的"),
      //   ],
      //   type: BottomNavigationBarType.fixed,
      // ),
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
    final TextEditingController titleController = TextEditingController();
    final TextEditingController noteController = TextEditingController();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            controller: titleController,
            decoration: InputDecoration(
              fillColor: Colors.grey.shade200,
              filled: true,
              suffixText: "标题",
              prefixIcon: Icon(Icons.title),
            ),
            onChanged: (titleText) {
              print("标题更新为: ");
              print(titleText);
              GlobalValues.currNoteBookTitle = titleText;
            },
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: noteController,
              maxLines: 36,
              decoration: InputDecoration(
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  // helperText: "标题",
                  // prefixIcon: Icon(Icons.title),
                  suffixText: "正文"),
              onChanged: (commtext) {
                print("正文更新为:");
                // print(commtext);
                print(noteController.text);
                GlobalValues.currNoteBookMemo = commtext;
              },
            ),
          ),
        ),
      ],
    );
  }
}
