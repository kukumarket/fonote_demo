// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fonote_demo/compentlib/compentlib-001.dart';
import 'package:fonote_demo/db/dbmanager.dart';
// import 'package:fonote_demo/function/notestool.dart';
// import 'package:flutter/rendering.dart';
import 'package:fonote_demo/tools/tools.dart';

import 'package:fonote_demo/compentlib/compentlib-002.dart';

double noteCatlogItemHeight = 150;

class MyTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(IconData(0xe632, fontFamily: 'NoteIcons'), size: 32),
        title: Text("测试页面"),
        actions: <Widget>[
          IconButton(
            icon: Icon(IconData(0xe7b6, fontFamily: 'NoteIcons'), size: 32),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(IconData(0xe723, fontFamily: 'NoteIcons'), size: 32),
            onPressed: () {},
          )
        ],
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          // border: Border.all(),
          image: DecorationImage(
            image: AssetImage("images/bg-qianli-03.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: MyTestArea(),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String bookName = GlobalValues.currNoteBookName;
          print("笔记本:$bookName 需要一个新的页面,尝试调用 getEmptyPage()获得新页面 page3");
          //addNewPage();
          String newPageid = "";
          newPageid = await getEmptyPage(bookName);
          print("笔记本:$bookName 中的新页面id为 $newPageid");
          GlobalValues.currNoteBookPageID = newPageid;
          Navigator.of(context).pushNamed('/page3');
        },
        tooltip: '添加新的笔记',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
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

class MyTestArea extends StatefulWidget {
  @override
  State<MyTestArea> createState() {
    return new MyTestAreaState();
  }
}

class MyTestAreaState extends State<MyTestArea> {
  @override
  Widget build(BuildContext context) {
    //return _getNoteCatlogList();
    Clib002001001SearchTextField clib002001001searchTextField =
        Clib002001001SearchTextField();

    Clib016002004NoteTitles clib016002004noteTitles = Clib016002004NoteTitles();
    void onChangedText(String stSearch) {
      print("当前需要搜索的内容是: " + stSearch);
    }

    return Column(
      children: [
        clib002001001searchTextField.getWidget(
            "输入您想要搜索的笔记内容", "在所有笔记中搜索", onChangedText, 4.0),
        clib016002004noteTitles.getWidget(),
        // Padding(
        //   padding: const EdgeInsets.all(4.0),
        //   child: TextField(
        //     decoration: InputDecoration(
        //       enabledBorder: OutlineInputBorder(
        //           borderSide: BorderSide(
        //         color: Colors.green, //边框颜色为绿色
        //         width: 1, //宽度为5
        //       )),
        //       fillColor: Color.fromARGB(150, 0xba, 0xca, 0xc6),
        //       filled: true,
        //       suffixText: "内容检索",
        //       prefixIcon: Icon(Icons.search),
        //     ),
        //     onChanged: (searchText) {},
        //   ),
        // ),
        //_getNoteCatlogList(),
        //"请输入笔记本名或者它的一部分。", "查找笔记本", _findNoteBook, 10

        // TextField(
        //   decoration: InputDecoration(
        //     fillColor: Color.fromARGB(150, 0xba, 0xca, 0xc6),
        //     filled: true,
        //     suffixText: "内容检索",
        //     prefixIcon: Icon(Icons.search),
        //   ),
        //   onChanged: (searchText) {},
        // ),
      ],
    );
  }

  // List<Widget> _getTestList() {
  //   List<Widget> mList = [];
  //   for (int ni = 0; ni < 15; ni++) {
  //     mList.add(_getTopicCard(ni + 1));
  //   }
  //   return mList;
  // }

  // Widget _getTopicCard(int page) {
  //   // double itemEdgeInset = 4.0;
  //   // void onTapCard() {
  //   //   print("页面索引<$page>被选择！");
  //   //   // print("需要跳转到对应的编辑页面！");
  //   // }

  //   Clib005002002NoteTitle clib005002002noteTitle = Clib005002002NoteTitle();
  //   return clib005002002noteTitle.getWidget(
  //       itemEdgeInset: 4.0,
  //       page: page,
  //       date: "2020年11月04日",
  //       week: "星期三",
  //       topic: "第一章 离开即是永别",
  //       context: "茫茫星海，人类是否是唯一智慧？");

  //   // GestureDetector(
  //   //   onTap: onTapCard,
  //   //   child: clib005002002noteTitle.getWidget(
  //   //     onTapCard,
  //   //       itemEdgeInset: 4.0,
  //   //       page: page,
  //   //       date: "2020年11月04日",
  //   //       week: "星期三",
  //   //       topic: "第一章 离开即是永别",
  //   //       context: "茫茫星海，人类是否是唯一智慧？"),
  //   // );
  // }
}
