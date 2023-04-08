import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_app/screens/basescreen/provider/baseprovider.dart';
import 'package:twitter_app/screens/basescreen/view/basescreen.dart';
import 'package:twitter_app/screens/homescreen/provider/homeprovider.dart';
import 'package:twitter_app/screens/homescreen/view/homescreen.dart';
import 'package:twitter_app/screens/searchscreen/provider/searchprovider.dart';
import 'package:twitter_app/screens/searchscreen/view/searchscreen.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Homeprovider(),),
        ChangeNotifierProvider(create: (context) => Searchprovider(),),
        ChangeNotifierProvider(create: (context) => Baseprovider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (context) => Basescreen(),
          'home' : (context) => Homescreen(),
          'search' : (context) => Searchscreen(),
        },
      ),
    ),
  );
}