import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_app/screens/homescreen/provider/homeprovider.dart';
import 'package:twitter_app/screens/homescreen/view/homescreen.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Homeprovider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (context) => Homescreen(),
        },
      ),
    ),
  );
}