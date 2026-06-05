import 'package:flutter/material.dart';

class MainViewModel with ChangeNotifier {
  int index = 0;


  void setIndex(int? index){
    if(index == null) return;
    this.index = index;
    notifyListeners();
  }

}