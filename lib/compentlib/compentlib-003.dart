import 'package:flutter/material.dart';
import 'package:fonote_demo/tools/tools.dart';

// Clib006003001ButtonIcon
// 带有特定onPressed事件，但是无标题的IconButton组件

// Clib007003001ButtonCaption
// 可设定内容、大小的，用于IconButton组件的标题组件

// Clib008003002IconButton
// 可设定属性的带标题的IconButton组件（组合件）

// Clib009003003NoteBooks
// 可根据标题列表，和给定属性，自动生成IconButton列表的组件（组合件）

// Clib010003004NoteBooksGrid
// 可根据标题列表，和给定属性，自动生成包含IconButton的，Grid列表的组件（组合件）

////////////////////////////////////////////////////////////////////////////
class Clib006003001ButtonIcon {
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

class Clib007003001ButtonCaption {
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

class Clib008003002IconButton {
  Widget getWidget(IconData iconData, Function() onPressedCallbaack,
      {String caption = "",
      Color iconcolor = Colors.blue,
      double iconsize = 40,
      double fontsize = 14,
      FontWeight fontweight = FontWeight.w600}) {
    Clib006003001ButtonIcon clib006003001buttonIcon = Clib006003001ButtonIcon();
    Clib007003001ButtonCaption clib007003001buttonCaption =
        Clib007003001ButtonCaption();
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        clib006003001buttonIcon.getWidget(iconData, onPressedCallbaack,
            caption: caption, iconcolor: iconcolor, iconsize: iconsize),
        clib007003001buttonCaption.getWidget(
            caption: caption,
            iconcolor: iconcolor,
            fontsize: fontsize,
            fontweight: fontweight),
      ],
    );
  }
}

class Clib009003003NoteBooksList {
  Clib008003002IconButton clib008003002iconButton = Clib008003002IconButton();
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
        return clib008003002iconButton.getWidget(
          IconData(0xe722, fontFamily: 'NoteIcons'),
          onPressedCallback,
          caption: item,
          iconcolor: iconcolor,
          iconsize: iconsize,
          fontsize: fontsize,
        );
      } else {
        return clib008003002iconButton.getWidget(
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

class Clib010003004NoteBooksGrid {
  Clib009003003NoteBooksList clib009003003noteBooksList =
      Clib009003003NoteBooksList();
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
          children: clib009003003noteBooksList.getWidget(
              myNotesNamesList, onPressCallback),
        ),
      ),
    );
  }
}
