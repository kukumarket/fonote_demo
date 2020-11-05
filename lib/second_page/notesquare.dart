import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fonote_demo/tools/tools.dart';
import 'package:fonote_demo/compentlib/compentlib-001.dart';
////////////////////////////////
///
///
///
///
///
///

class MyNoteSquarePage extends StatelessWidget {
  // Default placeholder text
  // ScrollController _controller = new ScrollController(); // 定义用于笔记本列表的滚动控制器

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("笔记广场"),
        ),
        body: Center(
          // child:
          // GestureDetector(
          // onTap: (){},
          // child: MyNotesArea(),
          // ),
          child: MyNoteSquareArea(),
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

class MyNoteSquareArea extends StatefulWidget {
  @override
  State<MyNoteSquareArea> createState() {
    return new MyNoteSquareAreaState();
  }
}

class MyNoteSquareAreaState extends State<MyNoteSquareArea> {
  WidgetLibLevel001TitleImage widgetLibLevel001TitleImage =
      new WidgetLibLevel001TitleImage();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widgetLibLevel001TitleImage.getWidget(),
        Expanded(child: _getPublicNoteList())
      ],
    );
  }

  ListView _getPublicNoteList() {
    return ListView(
      itemExtent: 80.0,
      children: [
        // Container(
        //   alignment: Alignment.center,
        //   child:
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/line-01.png"),
            SizedBox(width: 50), // 50宽度
            Text(
              "2020年09月",
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(width: 50), // 50宽度
            Image.asset("images/line-01.png"),
          ],
        ),
        Row(
          children: [
            SizedBox(width: 50), // 50宽度
            Column(
              children: [Text("9月21日"), Text("星期一")],
            ),
            SizedBox(width: 30), // 50宽度
            Column(
              children: [Text("今天的长城也很平静"), Text("非常平常的一天，护卫队没有什么大事。")],
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(width: 50), // 50宽度
            Column(
              children: [Text("9月21日"), Text("星期一")],
            ),
            SizedBox(width: 30), // 50宽度
            Column(
              children: [Text("再多喜欢阿离一点"), Text("可以吗？")],
            ),
          ],
        ),
        getListItem(
            '今天的长城也很平静', '非常平常的一天，护卫队没有什么大事。', Icons.print, _onnoteedit),
        getListItem(
            '今天的长城也很平静', '非常平常的一天，护卫队没有什么大事。', Icons.print, _onnoteedit),

        getListItem(
            '今天的长城也很平静', '非常平常的一天，护卫队没有什么大事。', Icons.print, _onnoteedit),
        getListItem(
            '今天的长城也很平静', '非常平常的一天，护卫队没有什么大事。', Icons.print, _onnoteedit),
        getListItem(
            '今天的长城也很平静', '非常平常的一天，护卫队没有什么大事。', Icons.print, _onnoteedit),

        getListItem('今天的长城也很平静', '非常平常的一天，护卫队没有什么大事。', Icons.print, _onnoteedit)
      ],
    );
  }

  void _onnoteedit() {
    //该函数被调用时, 使用此函数作为参数的函数中, 应当已经做了处理
    //比如确认是哪个按钮被按下flu
    // setState((){});
  }
  // static OverlayEntry _getNotesAddOverlayEntry
}
