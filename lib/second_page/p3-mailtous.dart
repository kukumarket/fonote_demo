// import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:fonote_demo/tools/tools.dart';

////////////////////////////////

class MailToUsPage extends StatelessWidget {
  // Default placeholder text

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("意见反馈"),
        ),
        body: Center(
          // child:
          // GestureDetector(
          // onTap: (){},
          // child: MyNotesArea(),
          // ),
          child: MailToUsArea(),
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

class MailToUsArea extends StatefulWidget {
  @override
  State<MailToUsArea> createState() {
    return new MailToUsAreaState();
  }
}

class MailToUsAreaState extends State<MailToUsArea> {
  @override
  Widget build(BuildContext context) {
    return Column(
        // children: [getMyNoteTitleImage(), Expanded(child: _getPublicNoteList())],
        );
    // Center(
    //     child: );
  }
}
