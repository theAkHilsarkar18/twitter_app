import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Searchprovider extends ChangeNotifier
{
  List trendingCategoryList = [
    "Sport",
    "Tesla",
    "Apple",
    "Google",
    "Wall street",
  ];
  List trendingHastagList = [
    "#ipl2023",
    "#ElonMusk, #SpaceX",
    "#iPhone14Pro, #iOS",
    "#Android14Launched",
    "#SiliconValleyBankrupt",
  ];
  List trendingTweetCount = [
    "198K",
    "127K",
    "89K",
    "56K",
    "27K",
  ];
  //======================================================================================

List sportCategoryList = [
  "IPL2023",
  "CSK vs GT",
  "ODI World-cup 2023",
  "MS Dhoni Retirement",
  "Global Sport",
];
List sportHastagList = [
  "#ipl2023, #TaTaIPL2023",
  "#GTvsCSK",
  "#worldcup",
  "#msd, #MSDhoni",
  "#GlobalSports",
];


  //======================================================================================

List buisnessCategoryList = [
  "Indian Buisness",
  "US Buisness",
  "China Buisness",
  "UAE Buisness",
  "Australia Buisness",
];

List buisnessHastagList = [
  "#AdaniDownfall, #Budget2023",
  "#SiliconvalleyBankrupt",
  "#ChinaBuisnessPolicy",
  "#NewTAXrulesOnOIL",
  "#Jobplacement",
];

  //======================================================================================

List HealthCategoryList = [
  "COVID IS BACK",
  "Indian Health Ministry",
  "WHO Reports",
  "Ukraine Health NGOs",
  "New Vaccine",
];
List HealthHastagList = [
  "#COVIDisBaack",
  "#HealthScams",
  "#who, #WHOreport2023",
  "#UkraineSoldier #LackOfHealthFacilty",
  "#YoungsterOnFire",
];
  //======================================================================================

  String country = "us";

  List countryList = [
    "in",
    "us",
    "cn",
    "uae",
    "au",
  ];

void changeBuisnessNews(String country)
{
  this.country = country;
  notifyListeners();
}











}