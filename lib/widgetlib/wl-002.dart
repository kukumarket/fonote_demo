import 'package:flutter/material.dart';

class WidgetLibOutNoteTopic {
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
