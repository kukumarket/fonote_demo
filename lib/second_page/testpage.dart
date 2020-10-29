// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fonote_demo/db/dbmanager.dart';
// import 'package:fonote_demo/function/notestool.dart';
// import 'package:flutter/rendering.dart';
import 'package:fonote_demo/tools/tools.dart';

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
            child: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            itemExtent: 80,
            children: _getTestList(),
          ),
        )),
      ],
    );
  }

  List<Widget> _getTestList() {
    List<Widget> mList = [];
    for (int ni = 0; ni < 100; ni++) {
      mList.add(_getTopicCard(ni + 1));
    }
    return mList;
  }

  Widget _getTopicCard(int page) {
    double itemEdgeInset = 4.0;
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              // color: Colors.blueAccent[100],
              padding: EdgeInsets.all(itemEdgeInset),
              margin: EdgeInsets.all(itemEdgeInset),
              //边框设置
              decoration: BoxDecoration(
                //背景
                color: Colors.blue[100],
                //设置四周圆角 角度
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                //设置四周边框
                border: new Border.all(width: 1, color: Colors.red),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text("2020年10月28日"),
                  ),
                  Container(
                    child: Text("星期三"),
                  ),
                  Container(
                    child: Text("第$page/100页"),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 7,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(itemEdgeInset),
                margin: EdgeInsets.only(
                    top: itemEdgeInset,
                    right: itemEdgeInset,
                    bottom: itemEdgeInset),
                //边框设置
                decoration: BoxDecoration(
                  //背景
                  color: Colors.green[200],
                  //设置四周圆角 角度
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  //设置四周边框
                  border: new Border.all(width: 1, color: Colors.red),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text("第一章 离开即是永别"),
                    ),
                    Container(
                      child: Text("茫茫星海，人类是否是唯一智慧？"),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
