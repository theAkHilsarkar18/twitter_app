import 'package:flutter/cupertino.dart';
import 'package:twitter_app/screens/homescreen/model/newsmodel.dart';

import '../../../utils/apihelper.dart';
import '../model/teslanews.dart';

class Homeprovider extends ChangeNotifier
{
  Teslanews? teslanews;
  Newsmodel? newsmodel;
  int selectedBottomNavigationBarIndex = 0;
  String company = "google";
  Future<Teslanews?> teslaJsonParshing(company)
  async {
    teslanews = await NewsHelper().teslaJsonNewsHelper(company);
    return teslanews;
    notifyListeners();
    //return teslanews;
  }

  Future<Newsmodel?> NewsJsonParshing(String country)
  async {
    newsmodel = await NewsHelper().CountryJsonNewsHelper(country);
    return newsmodel;
    notifyListeners();
    //return teslanews;
  }

  void changeCompany(String company)
  {
    this.company = company;
    notifyListeners();
  }

  void changeBottomNavigationBarIndex(int value)
  {
    selectedBottomNavigationBarIndex = value;
    notifyListeners();
  }

}