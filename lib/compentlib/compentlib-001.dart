import 'package:flutter/material.dart';

//此文档存放已经过基础修饰，无需组合使用的简单组件
class WidgetLibLevel001TitleImage {
  Widget getWidget() {
    return Image.asset("images/index_title.png");
  }
}

class WidgetLibLevel001SearchTextField {
  Widget getWidget(String hintStr, String labelStr,
      void Function(String) txtCallback, double marginSize) {
    return Container(
      margin: EdgeInsets.all(marginSize),
      child: TextField(
        // autofocus: true,
        cursorColor: Colors.deepOrange,
        cursorRadius: Radius.circular(20.0),
        cursorWidth: 10.0,
        maxLength: 20,
        // keyboardType:TextInputType.text,
        decoration: InputDecoration(
          // icon: Icon(Icons.supervised_user_circle),
          suffixIcon: Icon(Icons.search, size: 30),
          //文本内容的内边距
          contentPadding: EdgeInsets.all(10.0),
          // 圆角矩形的输入框样式
          border: OutlineInputBorder(
              // 圆角半径 10
              borderRadius: BorderRadius.circular(10.0)),
          // helperText: "请输入笔记本名称",
          // hintText: "请输入笔记本名或者它的一部分。",
          // labelText: "查找笔记本",
          hintText: hintStr,
          labelText: labelStr,
        ),

        //从外部传进提交文本之后的处理事件
        onSubmitted: txtCallback,
      ),
    );
  }
}
