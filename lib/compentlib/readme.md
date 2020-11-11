此目录(compentlib)用于存放页面中的组合件。
组合件:使用组件库(CompentsLib)中的组件(widget)组合而成的组件。
命名规则:

| 标题头 | 组合件顺序号 |调用库编号 | 调用级别编号 | 相关功能 | 组合件说明 |
| ---- | ---- | ---- | ---- |
| 例: clb| [xxx] | [xxx] | [xxx] | [xxx...] |

原则上，位于同一组合件的基本组件，均与组合件存放在同一dart文件中.
Level-xxx隐含地说明该组件是否为组合件


| 序号 | 文件名 | 类名 | 作用描述 | 
| ---- | ---- | ---- | ---- | 
| 001 | compentlib-001.dart | Clib001001001TitleImage | 返回标题图 | 
| 002 | compentlib-001.dart | Clib002001001SearchTextField | 返回查找文本框 | 
| 003 | compentlib-002.dart | Clib003002001NoteDate | 展示笔记创建时间和页码信息的一列三行组件 | 
| 004 | compentlib-002.dart | Clib004002001NoteTopic | 展示笔记标题和摘要的一列两行组件 | 
| 005 | compentlib-002.dart | Clib005002002NoteTitle | 展示笔记中单项内容信息的一行两列组件（组合件） |
| 006 | compentlib-003.dart | Clib006003001ButtonIcon | 带有特定onPressed事件，但是无标题的IconButton组件 | 
| 007 | compentlib-003.dart | Clib007003001ButtonCaption | 可设定内容、大小的，用于IconButton组件的标题组件 | 
| 008 | compentlib-003.dart | Clib008003002IconButton | 可设定属性的带标题的IconButton组件（组合件） | 
| 009 | compentlib-003.dart | Clib009003003NoteBooksList | 可根据标题列表和给定属性，自动生成IconButton列表的组件（组合件） | 
| 010 | compentlib-003.dart | Clib010003004NoteBooksGrid | 可根据标题列表，和给定属性，自动生成包含IconButton的，Grid列表的组件（组合件） | 
| 011 | compentlib-004.dart | Clib011004001IconFromNoteIcons | 从NoteIcons图标库中返回给定名称的图标 | 
| 012 | compentlib-004.dart | Clib012004002IconButton | 返回一个使用NoteIcons图标库中图标的图标按钮 | 
| 013 | compentlib-004.dart | Clib013004001BgImage | 返回一张给定的背景图片 | 
| 014 | compentlib-004.dart | Clib014004002BgBox | 返回一个带背景图的背景盒 | 
| 015 | compentlib-002.dart | Clib015002003NoteTitleList | 组合用于展示笔记本摘要的列表项 |
| 016 | compentlib-002.dart | Clib016002004NoteTitlesListView | 组合用于展示笔记本摘要的ListView |
| 017 | compentlib-004.dart | Clib017004001IconData| 从NoteIcons图标库中返回给定名称的图标数据 |

