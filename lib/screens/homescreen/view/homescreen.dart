import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_app/screens/homescreen/model/teslanews.dart';
import 'package:twitter_app/screens/homescreen/provider/homeprovider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  Homeprovider? homeproviderTrue;
  Homeprovider? homeproviderFalse;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   Provider.of<Homeprovider>(context,listen: false).teslaJsonParshing();
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    homeproviderTrue = Provider.of(context,listen: true);
    homeproviderFalse = Provider.of(context,listen: false);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: homeproviderFalse!.teslaJsonParshing(),
            builder: (context, snapshot) {
              if(snapshot.hasError)
                {
                  return Text("${snapshot.error}");
                }
              else if(snapshot.hasData)
                {
                  Teslanews? teslanews = snapshot.data;
                  List<Article> articleList = teslanews!.articles;
                  print(articleList);
                  return ListView.builder(itemBuilder: (context, index) => ListTile(title: Text("${articleList[index].title}"),),itemCount: articleList.length,);
                }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }




}
