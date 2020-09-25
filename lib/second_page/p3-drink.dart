// import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:fonote_demo/tools/tools.dart';

////////////////////////////////

class DrinkPage extends StatelessWidget {
  // Default placeholder text

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("请我们喝汽水"),
        ),
        body: Center(
          // child:
          // GestureDetector(
          // onTap: (){},
          // child: MyNotesArea(),
          // ),
          child: DrinkArea(),
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

class DrinkArea extends StatefulWidget {
  @override
  State<DrinkArea> createState() {
    return new DrinkAreaState();
  }
}

class DrinkAreaState extends State<DrinkArea> {
  @override
  Widget build(BuildContext context) {
    return Column(
        // children: [getMyNoteTitleImage(), Expanded(child: _getPublicNoteList())],
        );
    // Center(
    //     child: );
  }
}
