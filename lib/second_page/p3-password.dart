// import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:fonote_demo/tools/tools.dart';

////////////////////////////////

class ModifyPassPage extends StatelessWidget {
  // Default placeholder text

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("密码设置"),
        ),
        body: Center(
          // child:
          // GestureDetector(
          // onTap: (){},
          // child: MyNotesArea(),
          // ),
          child: ModifyPassArea(),
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

class ModifyPassArea extends StatefulWidget {
  @override
  State<ModifyPassArea> createState() {
    return new ModifyPassAreaState();
  }
}

class ModifyPassAreaState extends State<ModifyPassArea> {
  @override
  Widget build(BuildContext context) {
    return Column(
        // children: [getMyNoteTitleImage(), Expanded(child: _getPublicNoteList())],
        );
    // Center(
    //     child: );
  }
}
