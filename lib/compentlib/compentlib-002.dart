import 'package:flutter/material.dart';

// CompentsLibLevel001NoteDate
// 展示笔记创建时间和页码信息的一列三行组件

// CompentsLibLevel001NoteTopic
// 展示笔记标题和摘要的一列两行组件

// CompentsLibLevel002NoteTitle
// 展示笔记中单项内容信息的一行两列组件
// 该组件是组合组件

////////////////////////////////////////////////////////////////////////////
class CompentsLibLevel001NoteDate {
  Widget getWidget(double itemEdgeInset, int page, String date, String week) {
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

class CompentsLibLevel001NoteTopic {
  Widget getWidget(double itemEdgeInset, String topic, String context) {
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

class CompentsLibLevel002NoteTitle {
  CompentsLibLevel001NoteDate compentsLibLevel001NoteDate =
      CompentsLibLevel001NoteDate();
  CompentsLibLevel001NoteTopic compentsLibLevel001NoteTopic =
      CompentsLibLevel001NoteTopic();

  Widget getWidget(double itemEdgeInset, int page, String date, String week,
      String topic, String context) {
    return Container(
      child: Row(
        children: [
          Expanded(
              flex: 35,
              child: compentsLibLevel001NoteDate.getWidget(
                  itemEdgeInset, page, date, week)),
          Expanded(
              flex: 65,
              child: compentsLibLevel001NoteTopic.getWidget(
                  itemEdgeInset, topic, context)),
        ],
      ),
    );
  }
}
