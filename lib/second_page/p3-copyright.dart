// import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:fonote_demo/tools/tools.dart';

////////////////////////////////

class CopyRightPage extends StatelessWidget {
  // Default placeholder text

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("版权及免责声明"),
        ),
        body: Center(
          // child:
          // GestureDetector(
          // onTap: (){},
          // child: MyNotesArea(),
          // ),
          child: CopyRightArea(),
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

class CopyRightArea extends StatefulWidget {
  @override
  State<CopyRightArea> createState() {
    return new CopyRightAreaState();
  }
}

class CopyRightAreaState extends State<CopyRightArea> {
  @override
  Widget build(BuildContext context) {
    return Column(
        // children: [getMyNoteTitleImage(), Expanded(child: _getPublicNoteList())],
        );
    // Center(
    //     child: );
  }
}
