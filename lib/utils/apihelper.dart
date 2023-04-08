import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:twitter_app/screens/homescreen/model/teslanews.dart';

import '../screens/homescreen/model/newsmodel.dart';

class NewsHelper
{
  Teslanews? teslanews;
  Newsmodel? newsmodel;
  Future<Teslanews?> teslaJsonNewsHelper(String company)
  async {
    String? apiLink = "https://newsapi.org/v2/everything?q=$company&from=2023-04-07&to=2023-04-07&sortBy=popularity&apiKey=fc64b5f2f1d34ac69201d7af2469952c";
    Uri apiUrl = Uri.parse(apiLink);
    var response = await http.get(apiUrl);
    var json = jsonDecode(response.body);
    teslanews = Teslanews.fromJson(json);
    return teslanews;
  }

  Future<Newsmodel?> CountryJsonNewsHelper(String country)
  async {
    String? apiLink = "https://newsapi.org/v2/top-headlines?country=${country}&category=business&apiKey=fc64b5f2f1d34ac69201d7af2469952c";
    Uri apiUrl = Uri.parse(apiLink);
    var response = await http.get(apiUrl);
    var json = jsonDecode(response.body);
    newsmodel = Newsmodel.fromJson(json);
    return newsmodel;
  }

}