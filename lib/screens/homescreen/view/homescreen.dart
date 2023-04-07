import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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



  @override
  Widget build(BuildContext context) {
    homeproviderTrue = Provider.of(context, listen: true);
    homeproviderFalse = Provider.of(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: FutureBuilder(
            future: homeproviderFalse!.teslaJsonParshing(homeproviderTrue!.company),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else if (snapshot.hasData) {
                Teslanews? teslanews = snapshot.data;
                List<Article> articleList = teslanews!.articles;
                return Column(
                  children: [
                    twitterAppBar(),
                    twitterTabbar(),
                    Divider(color: Colors.grey, thickness: 0.1),
                    Container(
                      height: 548,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => twitterPostBox(
                          articleList[index].urlToImage!,
                          articleList[index].urlToImage!,
                          articleList[index].source.name,
                          articleList[index].author!,
                          articleList[index].title,
                        ),
                        itemCount: 10,
                      ),
                    ),
                  ],
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ),
        bottomNavigationBar: FlashyTabBar(

          animationDuration: Duration(milliseconds: 500),
          iconSize: 25,
          selectedIndex: homeproviderTrue!.selectedBottomNavigationBarIndex,
          onItemSelected: (value) {
            homeproviderFalse!.changeBottomNavigationBarIndex(value);
          },
          items: [
            FlashyTabBarItem(
              activeColor: Colors.blue,
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            FlashyTabBarItem(
              activeColor: Colors.blue,
              icon: InkWell(onTap: () {
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(onPressed: () {
                          homeproviderFalse!.changeCompany("apple");
                        }, child: Text("apple"),),
                        TextButton(onPressed: () {
                          homeproviderFalse!.changeCompany("google");

                        }, child: Text("Google"),),
                        TextButton(onPressed: () {
                          homeproviderFalse!.changeCompany("tesla");
                        }, child: Text("Tesla"),),
                      ],
                    ),
                  );
                },);
                homeproviderFalse!.changeBottomNavigationBarIndex(2);
              },child: Icon(Icons.search)),
              title: Text('Search'),
            ),
            FlashyTabBarItem(
              activeColor: Colors.blue,

              icon: Icon(Icons.mic_none_outlined),
              title: Text('Voice'),
            ),
            FlashyTabBarItem(
              activeColor: Colors.blue,

              icon: Icon(Icons.notifications_none),
              title: Text('Tweets'),
            ),
            FlashyTabBarItem(
              activeColor: Colors.blue,

              icon: Icon(Icons.mail_outline),
              title: Text('Inbox'),
            ),
          ],
        ),
      ),
    );
  }

  Widget twitterAppBar() {
    return Container(
      height: 77,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 15, top: 20, right: 15, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage("assets/img/my.jpg"),
                ),
                Image.asset("assets/img/logo.png", height: 22),
                Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          Divider(color: Colors.grey, thickness: 0.1),
        ],
      ),
    );
  }

  Widget twitterTabbar() {
    return DefaultTabController(
      length: 2,
      child: TabBar(
        unselectedLabelColor: Colors.black54,
        labelColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: [
          Tab(
            child: Text("For You", style: GoogleFonts.poppins()),
          ),
          Tab(
            child: Text("Following", style: GoogleFonts.poppins()),
          ),
        ],
      ),
    );
  }

  Widget twitterPostBox(String profile, String post, String accountName,
      String username, String title) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      height: 420,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.4),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage("$profile"),
            )
          ]),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("$accountName",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14)),
                    Spacer(),
                    Icon(
                      Icons.more_vert,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ],
                ),
                Text("  @$username",
                    style:
                        GoogleFonts.poppins(color: Colors.grey, fontSize: 11)),
                SizedBox(
                  height: 10,
                ),
                Text("$title",
                    style: GoogleFonts.poppins(color: Colors.black87)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  width: 450,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      "$post",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.chat_bubble_outline,
                        color: Colors.black54, size: 20),
                    SizedBox(
                      width: 2,
                    ),
                    Text("175",
                        style: TextStyle(color: Colors.black54, fontSize: 12)),
                    Spacer(),
                    Icon(Icons.repeat_outlined,
                        color: Colors.black54, size: 20),
                    SizedBox(
                      width: 2,
                    ),
                    Text("15",
                        style: TextStyle(color: Colors.black54, fontSize: 12)),
                    Spacer(),
                    Icon(Icons.favorite_border,
                        color: Colors.black54, size: 20),
                    SizedBox(
                      width: 2,
                    ),
                    Text("358",
                        style: TextStyle(color: Colors.black54, fontSize: 12)),
                    Spacer(),
                    Icon(Icons.bar_chart, color: Colors.black54, size: 20),
                    SizedBox(
                      width: 2,
                    ),
                    Text("78.2K",
                        style: TextStyle(color: Colors.black54, fontSize: 12)),
                    Spacer(),
                    Icon(Icons.share_outlined, color: Colors.black54, size: 20),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
