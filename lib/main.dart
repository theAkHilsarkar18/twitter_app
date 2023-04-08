import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_app/screens/basescreen/provider/baseprovider.dart';
import 'package:twitter_app/screens/basescreen/view/basescreen.dart';
import 'package:twitter_app/screens/homescreen/provider/homeprovider.dart';
import 'package:twitter_app/screens/homescreen/view/homescreen.dart';
import 'package:twitter_app/screens/searchscreen/provider/searchprovider.dart';
import 'package:twitter_app/screens/searchscreen/view/searchscreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Homeprovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Searchprovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Baseprovider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => Splashscreen(),
          'base': (context) => Basescreen(),
          'home': (context) => Homescreen(),
          'search': (context) => Searchscreen(),
        },
      ),
    ),
  );
}

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 4), () { Navigator.pushReplacementNamed(context, 'base');});
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset("assets/img/logo.png",height: 50,),
        ),
      ),
    );
  }
}
