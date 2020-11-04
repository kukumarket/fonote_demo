import 'package:flutter/material.dart';
// import 'package:fonote_demo/db/dbmanager.dart';
// import 'package:fonote_demo/function/notestool.dart';
// import 'package:flutter/rendering.dart';
// import 'package:fonote_demo/tools/tools.dart';
import 'package:fonote_demo/widgetlib/wl-001.dart';
import 'package:fonote_demo/widgetlib/wl-002.dart';

class CompentLibOutNoteTitle {
  WidgetLibOutNoteDate _widgetLibOutNoteDate = WidgetLibOutNoteDate();
  WidgetLibOutNoteTopic _widgetLibOutNoteTopic = WidgetLibOutNoteTopic();

  Widget getWidget(double itemEdgeInset, int page, String date, String week,
      String topic, String context) {
    return Container(
      child: Row(
        children: [
          Expanded(
              flex: 35,
              child: _widgetLibOutNoteDate.getWidget(
                  itemEdgeInset, page, date, week)),
          Expanded(
              flex: 65,
              child: _widgetLibOutNoteTopic.getWidget(
                  itemEdgeInset, topic, context)),
        ],
      ),
    );
  }
}
