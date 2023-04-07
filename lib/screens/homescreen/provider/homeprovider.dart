import 'package:flutter/cupertino.dart';

import '../../../utils/apihelper.dart';
import '../model/teslanews.dart';

class Homeprovider extends ChangeNotifier
{
  Teslanews? teslanews;

  Future<Teslanews?> teslaJsonParshing()
  async {
    teslanews = await TeslaNewsHelper().teslaJsonNewsHelper();
    return teslanews;
  }

}