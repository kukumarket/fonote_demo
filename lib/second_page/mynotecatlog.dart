// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fonote_demo/db/dbmanager.dart';
// import 'package:fonote_demo/function/notestool.dart';
// import 'package:flutter/rendering.dart';
import 'package:fonote_demo/tools/tools.dart';

class MyNoteCatlogPage extends StatelessWidget {
  // Default placeholder text
  // ScrollController _controller = new ScrollController(); // 定义用于笔记本列表的滚动控制器
  // void addNewPage() async {
  //   String mNoteBookName = GlobalValues.currNoteBookName;
  //   print("addNewPage() 尝试为笔记本$mNoteBookName 添加页面．");
  //   await DBManager.init(noteDB);
  //   String newPageID =
  //       await DBManager.newNotePage(GlobalValues.currNoteBookName);
  //   print("newPageID =  " + newPageID);
  //   await DBManager.close();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(IconData(0xe632, fontFamily: 'NoteIcons'), size: 32),
        title: Text(GlobalValues.currNoteBookName),
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
          child: MyNoteCatlogArea(),
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

class MyNoteCatlogArea extends StatefulWidget {
  @override
  State<MyNoteCatlogArea> createState() {
    return new MyNoteCatlogAreaState();
  }
}

class MyNoteCatlogAreaState extends State<MyNoteCatlogArea> {
  @override
  Widget build(BuildContext context) {
    //return _getNoteCatlogList();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            decoration: InputDecoration(
              fillColor: Colors.grey.shade200,
              filled: true,
              suffixText: "日志内容",
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (searchText) {},
          ),
        ),
        //_getNoteCatlogList(),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            itemExtent: 200.0,
            children: _getTestList(),
          ),
        )),
      ],
    );
  }

  List<Widget> _getTestList() {
    List<Widget> mList = [];
    for (int ni = 0; ni < 6; ni++) {
      mList.add(Container(child: Text("xxa")));
    }
    return mList;
  }

  // ListView _getNoteCatlogList() {
  //   return ListView(
  //     children: [
  //       Card(
  //         elevation: 20.0,
  //       ),

  //       // ListTile(
  //       //   title: Text("234234"),
  //       // ),
  //     ],
  //   );
  // }
}
