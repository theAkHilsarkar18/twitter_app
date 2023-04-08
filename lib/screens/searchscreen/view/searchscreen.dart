import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:twitter_app/screens/searchscreen/provider/searchprovider.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({Key? key}) : super(key: key);

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  TabController? tabController;

  @override
  Widget build(BuildContext context) {
    Searchprovider searchproviderTrue = Provider.of(context, listen: true);
    Searchprovider searchproviderFalse = Provider.of(context, listen: false);

    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5,
                ),
                TabBar(
                  controller: tabController,
                  isScrollable: true,
                  unselectedLabelColor: Colors.black54,
                  labelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(
                      child: Text("Trending", style: GoogleFonts.poppins()),
                    ),
                    Tab(
                      child: Text("Sport", style: GoogleFonts.poppins()),
                    ),
                    Tab(
                      child: Text("Buisness", style: GoogleFonts.poppins()),
                    ),
                    Tab(
                      child: Text("Health", style: GoogleFonts.poppins()),
                    ),
                  ],
                ),
                Container(
                  height: 600,
                  child: TabBarView(
                    physics: BouncingScrollPhysics(),
                    controller: tabController,
                    children: [
                      Trendingscreen(),
                      Sportscreen(),
                      Buisnesscreen(),
                      Healthscreen(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Trendingscreen extends StatefulWidget {
  const Trendingscreen({Key? key}) : super(key: key);

  @override
  State<Trendingscreen> createState() => _TrendingscreenState();
}

class _TrendingscreenState extends State<Trendingscreen> {
  @override
  Widget build(BuildContext context) {
    Searchprovider searchproviderTrue = Provider.of(context, listen: true);
    Searchprovider searchproviderFalse = Provider.of(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Top Trends",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  letterSpacing: 1),
            ),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => topList(
                  searchproviderTrue.trendingCategoryList[index],
                  searchproviderTrue.trendingHastagList[index],
                searchproviderTrue.trendingTweetCount[index],
                index+1,
              ),
              itemCount: 5,
              shrinkWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}

//-------------------------------------------------------------------------------------------------------------------------------------

class Sportscreen extends StatefulWidget {
  const Sportscreen({Key? key}) : super(key: key);

  @override
  State<Sportscreen> createState() => _SportscreenState();
}

class _SportscreenState extends State<Sportscreen> {
  @override
  Widget build(BuildContext context) {
    Searchprovider searchproviderTrue = Provider.of(context, listen: true);
    Searchprovider searchproviderFalse = Provider.of(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Top Trends",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  letterSpacing: 1),
            ),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => topList(
                searchproviderTrue.sportCategoryList[index],
                searchproviderTrue.sportHastagList[index],
                searchproviderTrue.trendingTweetCount[index],
                index+1,
              ),
              itemCount: 5,
              shrinkWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}


//-------------------------------------------------------------------------------------------------------------------------------------

class Buisnesscreen extends StatefulWidget {
  const Buisnesscreen({Key? key}) : super(key: key);

  @override
  State<Buisnesscreen> createState() => _BuisnesscreenState();
}

class _BuisnesscreenState extends State<Buisnesscreen> {
  @override
  Widget build(BuildContext context) {
    Searchprovider searchproviderTrue = Provider.of(context, listen: true);
    Searchprovider searchproviderFalse = Provider.of(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Top Trends",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  letterSpacing: 1),
            ),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => topList(
                searchproviderTrue.buisnessCategoryList[index],
                searchproviderTrue.buisnessHastagList[index],
                searchproviderTrue.trendingTweetCount[index],
                index+1,
              ),
              itemCount: 5,
              shrinkWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}


//-------------------------------------------------------------------------------------------------------------------------------------

class Healthscreen extends StatefulWidget {
  const Healthscreen({Key? key}) : super(key: key);

  @override
  State<Healthscreen> createState() => _HealthscreenState();
}

class _HealthscreenState extends State<Healthscreen> {
  @override
  Widget build(BuildContext context) {
    Searchprovider searchproviderTrue = Provider.of(context, listen: true);
    Searchprovider searchproviderFalse = Provider.of(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Top Trends",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  letterSpacing: 1),
            ),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => topList(
                searchproviderTrue.HealthCategoryList[index],
                searchproviderTrue.HealthHastagList[index],
                searchproviderTrue.trendingTweetCount[index],
                index+1,
              ),
              itemCount: 5,
              shrinkWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}


//-------------------------------------------------------------------------------------------------------------------------------------



//=========================================================================================================================================

Widget topList(String name, String hastag, String tweet,int index) {
  return Container(
    padding: EdgeInsets.all(5),
    height: 100,
    width: double.infinity,
    alignment: Alignment.centerLeft,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$index - $name - Trending",
            style: GoogleFonts.poppins(color: Colors.black54, fontSize: 12)),
        Text("$hastag",
            style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500)),
        Text("${tweet} Tweets",
            style: GoogleFonts.poppins(color: Colors.black54, fontSize: 11)),
      ],
    ),
  );
}

//=========================================================================================================================================
