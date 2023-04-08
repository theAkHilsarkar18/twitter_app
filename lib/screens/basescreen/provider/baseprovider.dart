import 'package:flutter/material.dart';
import 'package:twitter_app/screens/homescreen/view/homescreen.dart';
import 'package:twitter_app/screens/searchscreen/view/searchscreen.dart';

class Baseprovider extends ChangeNotifier {

  int screenIndex = 0;

  List screenList = [
    Homescreen(),
    Searchscreen(),
    Homescreen(),
    Searchscreen(),
    Homescreen(),
  ];


  void changeScreenIndex(int index)
  {
    screenIndex = index;
    notifyListeners();
  }

}