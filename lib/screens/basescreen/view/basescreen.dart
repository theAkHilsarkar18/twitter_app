import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_app/screens/basescreen/provider/baseprovider.dart';
import 'package:twitter_app/screens/homescreen/view/homescreen.dart';

class Basescreen extends StatefulWidget {
  const Basescreen({Key? key}) : super(key: key);

  @override
  State<Basescreen> createState() => _BasescreenState();
}

class _BasescreenState extends State<Basescreen> {
  Baseprovider? baseproviderTrue;
  Baseprovider? baseproviderFalse;

  @override
  Widget build(BuildContext context) {
    baseproviderTrue = Provider.of(context, listen: true);
    baseproviderFalse = Provider.of(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            baseproviderTrue!.screenList[baseproviderTrue!.screenIndex],
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(bottom: 10),
                height: 40,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: () {
                          baseproviderFalse!.changeScreenIndex(0);
                        },
                        child: Icon(
                          Icons.home_outlined,
                        )),
                    InkWell(
                        onTap: () {
                          baseproviderFalse!.changeScreenIndex(1);
                        },
                        child: Icon(Icons.search)),
                    InkWell(
                        onTap: () {
                          baseproviderFalse!.changeScreenIndex(2);
                        },
                        child: Icon(Icons.mic_none)),
                    InkWell(
                        onTap: () {
                          baseproviderFalse!.changeScreenIndex(3);
                        },
                        child: Icon(Icons.notifications_none)),
                    InkWell(
                        onTap: () {
                          baseproviderFalse!.changeScreenIndex(4);
                        },
                        child: Icon(Icons.email_outlined)),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.only(right: 20,bottom: 70),
                height: 60,
                width: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.edit,color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
