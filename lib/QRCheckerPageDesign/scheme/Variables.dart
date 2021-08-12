import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Variables {
  int currentPageIndex = 0;

  List historyList = [];
  List favoriteList = [];

  Color backgroundColor = Colors.grey.shade900;
  Color bottomBarColor = Colors.white;
 
  List bottomBarIcons = [
    [CupertinoIcons.clock, CupertinoIcons.clock_fill],
    [CupertinoIcons.heart, CupertinoIcons.heart_fill],
  ];

  int generatorID(){
    int newID = 0;
    for (var item in historyList) {
      if (item.itemID != newID){
        return newID;
      }
    }

    return newID;
  }
}