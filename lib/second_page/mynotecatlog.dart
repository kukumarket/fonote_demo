// import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:fonote_demo/tools/tools.dart';

class MyNoteCatlogPage extends StatelessWidget {
  // Default placeholder text
  // ScrollController _controller = new ScrollController(); // 定义用于笔记本列表的滚动控制器

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(IconData(0xe632, fontFamily: 'NoteIcons'), size: 32),
        title: Text("我的笔记本"),
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
      body: Center(
        // child:
        // GestureDetector(
        // onTap: (){},
        // child: MyNotesArea(),
        // ),
        child: MyNoteCatlogArea(),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: '添加新的笔记',
        child: Icon(Icons.add),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.

      bottomNavigationBar: BottomNavigationBar(
        items: [
          getBottomNavigationBar(Icons.print, Colors.blue, 30, "个人笔记"),
          getBottomNavigationBar(Icons.print, Colors.blue, 30, "笔记广场"),
          getBottomNavigationBar(Icons.print, Colors.blue, 30, "千里官宣"),
          getBottomNavigationBar(Icons.print, Colors.blue, 30, "我的"),
        ],
        type: BottomNavigationBarType.fixed,
      ),
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
    return _getNoteCatlogList();
    // return Column(
    //   children: [
    //     // getMyNoteTitleImage(),
    //     // getTextField("请输入笔记本名或者它的一部分。", "查找笔记本", _findNoteBook),
    //     // getNoteBookGrid(),
    //   ],
    // );
  }

  ListView _getNoteCatlogList() {
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
        Divider(
          height: 3,
          color: Colors.black,
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
}
