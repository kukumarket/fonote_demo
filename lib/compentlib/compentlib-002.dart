import 'package:flutter/material.dart';

// Clib003002001NoteDate
// 展示笔记创建时间和页码信息的一列三行组件

// Clib004002001NoteTopic
// 展示笔记标题和摘要的一列两行组件

// Clib005002002NoteTitle
// 展示笔记中单项内容信息的一行两列组件
// 该组件是组合组件

////////////////////////////////////////////////////////////////////////////
class Clib003002001NoteDate {
  Widget getWidget(
      {double itemEdgeInset = 4.0,
      int page = 1,
      String date = "",
      String week = ""}) {
    return Container(
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
            margin: EdgeInsets.all(2.0),
            child: Text(date),
          ),
          Container(
            margin: EdgeInsets.all(2.0),
            child: Text(week),
          ),
          Container(
            margin: EdgeInsets.all(2.0),
            child: Text("第$page/100页"),
          ),
        ],
      ),
    );
  }
}

class Clib004002001NoteTopic {
  Widget getWidget(
      {double itemEdgeInset = 4.0, String topic = "", String context = ""}) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(itemEdgeInset),
      margin: EdgeInsets.only(
          top: itemEdgeInset, right: itemEdgeInset, bottom: itemEdgeInset),
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
            margin: EdgeInsets.all(2.0),
            child: Text(topic),
          ),
          Container(
            margin: EdgeInsets.all(2.0),
            child: Text(context),
          ),
        ],
      ),
    );
  }
}

class Clib005002002NoteTitle {
  Clib003002001NoteDate clib003002001noteDate = Clib003002001NoteDate();
  Clib004002001NoteTopic clib004002001noteTopic = Clib004002001NoteTopic();

  Widget getWidget(
      {double itemEdgeInset = 4.0,
      int page = 1,
      String date = "",
      String week = "",
      String topic = "",
      String context = ""}) {
    return GestureDetector(
      onTap: () {
        print("页面索引<$page>被选择！");
        // onTapCallback();
      },
      child: Container(
        child: Row(
          children: [
            Expanded(
                flex: 40,
                child: clib003002001noteDate.getWidget(
                    itemEdgeInset: itemEdgeInset,
                    page: page,
                    date: date,
                    week: week)),
            Expanded(
                flex: 60,
                child: clib004002001noteTopic.getWidget(
                    itemEdgeInset: itemEdgeInset,
                    topic: topic,
                    context: context)),
          ],
        ),
      ),
    );
  }
}

class Clib015002003NoteTitleList {
  List<Widget> mList = [];
  void onPressCallBack(int page) {
    print("页面(索引<$page>)被选择！");
  }

  List<Widget> getWidget(
      {double itemEdgeInset = 4.0,
      int page = 1,
      String date = "",
      String week = "",
      String topic = "",
      String context = ""}) {
    Clib005002002NoteTitle clib005002002noteTitle = Clib005002002NoteTitle();

    for (int ni = 0; ni < 15; ni++) {
      //获取第ni页的内容，并且将对应值(日期、星期、标题、摘要)赋予对应的Title
      mList.add(clib005002002noteTitle.getWidget(page: ni + 1));
    }
    return mList;
  }
}

class Clib016002004NoteTitles {
  Clib015002003NoteTitleList clib015002003noteTitleList =
      Clib015002003NoteTitleList();
  Widget getWidget({int flex = 1, int itemextent = 100}) {
    return Expanded(
      flex: 1,
      child: ListView(
        itemExtent: 100,
        // children: _getTestList(),
        children: clib015002003noteTitleList.getWidget(),
      ),
      //     child: Container(
      //   // padding: const EdgeInsets.all(20),
      //   child: ListView(
      //     itemExtent: 100,
      //     // children: _getTestList(),
      //     children: clib015666002003noteTitleList.getWidget(),
      //   ),
      // )
    );
  }
}
