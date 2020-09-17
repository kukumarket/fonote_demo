import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fonote_demo/second_page/mynotes.dart';
import 'package:fonote_demo/second_page/mynotecatlog.dart';

void main() {
  runApp(FooNoteApp());
  //fooNoteApp是本程序的主进程
  //接下是4个主页面
  //名字 - 类名 - 说明
  //page1 - MyNotes - 我的笔记
  //page2 - NoteSquare - 笔记广场
  //page3 - QianLiCommunity - 千里社区
  //page4 - MyInformation - 我的 - (信息&设置)
}

class FooNoteApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.

        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: WelcomePage(title: '千里之行 始于足下---'),
      home: MyWelComePage(),
      routes: <String, WidgetBuilder>{
        '/page1': (BuildContext context) => new MyNotePage(), //此界面显示我的笔记本
        '/page2': (BuildContext context) =>
            new MyNoteCatlogPage(), //此界面显示给定笔记本中的笔记列表
        //'/page3':(BuildContext context) => new MyNoteEditPage(),//此界面显示指定笔记的编辑页面
      },
    );
  }
}

//定时器放在类定义中的时候，会引起
//This class (or a class that this class inherits from) is marked as '@immutable',
//but one or more of its instance fields aren't final: MyWelComePage.welcomTimer
//因此将_welcomTimer更改为 welcomTimer，并放到类外。
Timer welcomTimer;

class MyWelComePage extends StatelessWidget {
  MyWelComePage({Key key, this.parameter}) : super(key: key);
  final parameter;

  @override
  Widget build(BuildContext context) {
    welcomTimer = new Timer(new Duration(seconds: 5), () {
      // 只在倒计时结束时回调
      print("已到5秒,前往笔记页面. ");
      Navigator.of(context).pushNamed('/page1');
      welcomTimer.cancel();
    });
    return Scaffold(
      // backgroundColor: Color(0xFFAAC8DC),

      // appBar: AppBar(
      // // Here we take the value from the MyHomePage object that was created by
      // // the App.build method, and use it to set our appbar title.
      // title: Text(widget.title),
      // //toolbarHeight: 50,
      // // backgroundColor: Color(0xFFAAC8DC),
      // ),

      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new InkWell(
          onTap: () {
            print("单击欢迎页面，前往笔记页面.");
            Navigator.of(context).pushNamed('/page1');
          },
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Text(
              // 	'You have pushed the button this many times:',
              // ),

              //Image.file(new File("images/footnote-welcome.png")),
              // Image.network(
              // 		"https://pic.downk.cc/item/5f2eb38e14195aa5947a89c3.png"),
              Image.asset("images/footnote-welcome.png"),
              //D:\flutter_project\foonote_demo\foonote_demo\src\images\footnote-welcome.png
              //src\images\footnote-welcome.png
              // Text(
              // 	'$_counter',
              // 	style: Theme.of(context).textTheme.headline4,
              // ),
              _getWelcomeText(),
            ],
          ),
        ),
      ),
    );
  }

  Text _getWelcomeText() {
    return Text('您的每个灵感,我们都在。'
        // style: TextStyle(fontSize: 20),
        );
  }
}
