import 'package:flutter/material.dart';
import 'package:fonote_demo/tools/tools.dart';

class WidgetLibLevel001ButtonIcon {
  Widget getWidget(
    IconData iconData,
    Function() onPressedCallback, {
    String caption = "",
    Color iconcolor = Colors.blue,
    double iconsize = 40,
  }) {
    return new IconButton(
        icon: Icon(iconData, color: iconcolor, size: iconsize),
        // onPressed: callback),
        onPressed: () => {
              GlobalValues.currNoteBookName = caption,
              onPressedCallback(),
            });
  }
}

class WidgetLibLevel001ButtonCaption {
  Widget getWidget(
      {String caption = "",
      Color iconcolor = Colors.blue,
      double fontsize = 14,
      FontWeight fontweight = FontWeight.w600}) {
    return new Container(
      margin: const EdgeInsets.only(top: 8.0),
      child: Text(
        caption,
        style: TextStyle(
          fontSize: fontsize,
          fontWeight: fontweight,
          color: iconcolor,
        ),
      ),
    );
  }
}

class WidgetLibLevel002IconButton {
  Widget getWidget(IconData iconData, Function() onPressedCallbaack,
      {String caption = "",
      Color iconcolor = Colors.blue,
      double iconsize = 40,
      double fontsize = 14,
      FontWeight fontweight = FontWeight.w600}) {
    WidgetLibLevel001ButtonIcon widgetLibLevel001ButtonIcon =
        WidgetLibLevel001ButtonIcon();
    WidgetLibLevel001ButtonCaption widgetLibLevel001ButtonCaption =
        WidgetLibLevel001ButtonCaption();
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widgetLibLevel001ButtonIcon.getWidget(iconData, onPressedCallbaack,
            caption: caption, iconcolor: iconcolor, iconsize: iconsize),
        widgetLibLevel001ButtonCaption.getWidget(
            caption: caption,
            iconcolor: iconcolor,
            fontsize: fontsize,
            fontweight: fontweight),
      ],
    );
  }
}

class WidgetLibLevel003NoteBooks {
  WidgetLibLevel002IconButton widgetLibLevel002IconButton =
      WidgetLibLevel002IconButton();
  List<Widget> getWidget(
      List<String> noteBookList, Function() onPressedCallback,
      {String caption = "",
      Color iconcolor = Colors.blue,
      double iconsize = 40,
      double fontsize = 14,
      FontWeight buttonfontweight = FontWeight.w600}) {
    return myNotesNamesList.map((item) {
      print(item);

      if (item == "添加笔记本") {
        return widgetLibLevel002IconButton.getWidget(
          IconData(0xe722, fontFamily: 'NoteIcons'),
          onPressedCallback,
          caption: item,
          iconcolor: iconcolor,
          iconsize: iconsize,
          fontsize: fontsize,
        );
      } else {
        return widgetLibLevel002IconButton.getWidget(
            IconData(0xe632, fontFamily: 'NoteIcons'), onPressedCallback,
            caption: item,
            iconcolor: iconcolor,
            iconsize: iconsize,
            fontsize: fontsize,
            fontweight: FontWeight.normal);
      }
    }).toList();
  }
}

class CompentsLibLevel001NoteBooks {
  WidgetLibLevel003NoteBooks widgetLibLevel003NoteBooks =
      WidgetLibLevel003NoteBooks();
  Widget getWidget(Function() onPressCallback, Function() onTapCallback) {
    return Expanded(
      child: GestureDetector(
        onTap: onTapCallback,
        child: GridView(
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          controller: ScrollController(), // 设置控制器
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, //横轴三个子widget
              childAspectRatio: 1.0 //宽高比为1时，子widge
              ),
          // children: _getNoteBooksList(),
          children: widgetLibLevel003NoteBooks.getWidget(
              myNotesNamesList, onPressCallback),
        ),
      ),
    );
  }
}
