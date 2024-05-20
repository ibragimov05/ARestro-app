import 'package:flutter/cupertino.dart';

class TabBoxData {
  int index;
  bool isTrue;

  TabBoxData({required this.index, required this.isTrue});
}

List<TabBoxData> tabBoxData = [
  TabBoxData(index: 0, isTrue: true),
  TabBoxData(index: 1, isTrue: false),
];
