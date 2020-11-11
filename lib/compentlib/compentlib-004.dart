import 'package:flutter/material.dart';

// Clib011004001IconFromNoteIcons
// 从NoteIcons图标库中返回给定名称的图标

// Clib012004002IconButton
// 根据给定名称和大小创建带有可处理onPress事件的IconButton

// Clib013004001BgImage
// 返回一张背景图

// Clib014004002BgBox
// 返回一个包含背景图的BoxDecoration

////////////////////////////////////////////////////////////////////////////
///
int getIconIndex(String iconName) {
  int mret = 0xe650;
  if (iconName == "默认图标") {
    mret = 0xe650;
  } else if (iconName == "搜索") {
    mret = 0xe723;
  } else if (iconName == "right") {
    mret = 0xe7eb;
  } else if (iconName == "日历") {
    mret = 0xe7b6;
  }
  return mret;
}

class Clib017004001IconData {
  IconData getWidget(
      {String iconName = "默认图标",
      double iconSize = 32,
      Color color = Colors.blue}) {
    return IconData(getIconIndex(iconName), fontFamily: 'NoteIcons');
  }
}

class Clib011004001IconFromNoteIcons {
  Icon getWidget(
      {String iconName = "默认图标",
      double iconSize = 32,
      Color color = Colors.blue}) {
    return Icon(
      IconData(getIconIndex(iconName), fontFamily: 'NoteIcons'),
      size: iconSize,
      color: color,
    );
  }
}

class Clib012004002IconButton {
  Clib011004001IconFromNoteIcons clib011004001iconFromNoteIcons =
      Clib011004001IconFromNoteIcons();
  IconButton getWidget(void Function() onPressedCallback,
      {String iconName = "默认图标",
      double iconSize = 32,
      Color color = Colors.blue}) {
    return IconButton(
      icon: clib011004001iconFromNoteIcons.getWidget(
          iconName: iconName, iconSize: iconSize, color: color),
      onPressed: () {
        onPressedCallback();
      },
    );
  }
}

class Clib013004001BgImage {
  DecorationImage getWidget({String imageName = "images/bg-qianli-03.png"}) {
    return DecorationImage(
      image: AssetImage(imageName),
      fit: BoxFit.cover,
    );
  }
}

class Clib014004002BgBox {
  Clib013004001BgImage clib013004001bgImage = Clib013004001BgImage();
  BoxDecoration getWidget({String imageName = "images/bg-qianli-03.png"}) {
    return BoxDecoration(
        // border: Border.all(),
        image: clib013004001bgImage.getWidget(imageName: imageName));
  }
}
