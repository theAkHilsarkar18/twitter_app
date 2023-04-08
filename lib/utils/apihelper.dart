import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:twitter_app/screens/homescreen/model/teslanews.dart';

class TeslaNewsHelper
{
  Teslanews? teslanews;
  Future<Teslanews?> teslaJsonNewsHelper(String company)
  async {
    String? apiLink = "https://newsapi.org/v2/everything?q=$company&from=2023-03-08&sortBy=publishedAt&apiKey=fc64b5f2f1d34ac69201d7af2469952c";
    Uri apiUrl = Uri.parse(apiLink);
    var response = await http.get(apiUrl);
    var json = jsonDecode(response.body);
    teslanews = Teslanews.fromJson(json);
    return teslanews;
  }
}