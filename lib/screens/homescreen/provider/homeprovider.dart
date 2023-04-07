import 'package:flutter/cupertino.dart';

import '../../../utils/apihelper.dart';
import '../model/teslanews.dart';

class Homeprovider extends ChangeNotifier
{
  Teslanews? teslanews;
  int selectedBottomNavigationBarIndex = 0;
  String company = "tesla";
  Future<Teslanews?> teslaJsonParshing(company)
  async {
    teslanews = await TeslaNewsHelper().teslaJsonNewsHelper(company);
    return teslanews;
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