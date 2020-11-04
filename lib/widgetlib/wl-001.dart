import 'package:flutter/material.dart';

class WidgetLibOutNoteDate {
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
