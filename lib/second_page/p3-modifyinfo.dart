// import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:fonote_demo/tools/tools.dart';

////////////////////////////////
///
///
///
///
///
///

class ModifyMyInfomationPage extends StatelessWidget {
  // Default placeholder text

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("修改个人信息"),
        ),
        body: Center(
          // child:
          // GestureDetector(
          // onTap: (){},
          // child: MyNotesArea(),
          // ),
          child: ModifyMyInfomationArea(),
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

class ModifyMyInfomationArea extends StatefulWidget {
  @override
  State<ModifyMyInfomationArea> createState() {
    return new ModifyMyInfomationAreaState();
  }
}

class ModifyMyInfomationAreaState extends State<ModifyMyInfomationArea> {
  @override
  Widget build(BuildContext context) {
    return Column(
        // children: [getMyNoteTitleImage(), Expanded(child: _getPublicNoteList())],
        );
    // Center(
    //     child: );
  }

  // ListView _getPublicNoteList() {
  //   return ListView(
  //     itemExtent: 80.0,
  //     children: [
  //       getMyInfoListTitle(IconData(0xe60b, fontFamily: 'NoteIcons'), "修改信息",
  //           context, '/page6'),
  //       getMyInfoListTitle(IconData(0xe66d, fontFamily: 'NoteIcons'), "密码设置",
  //           context, '/page7'),
  //       getMyInfoListTitle(IconData(0xe6aa, fontFamily: 'NoteIcons'), "请我们喝汽水",
  //           context, '/page8'),
  //       getMyInfoListTitle(IconData(0xe633, fontFamily: 'NoteIcons'), "回收站",
  //           context, '/page9'),
  //       getMyInfoListTitle(IconData(0xe63e, fontFamily: 'NoteIcons'), "意见反馈",
  //           context, '/page10'),
  //       getMyInfoListTitle(IconData(0xe6b5, fontFamily: 'NoteIcons'), "版权及免责声明",
  //           context, '/page11'),
  //     ],
  //   );
  // }
}
