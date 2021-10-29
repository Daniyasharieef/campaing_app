// import 'package:campaign_app/page/create_page.dart';
// import 'package:campaign_app/page/save_page.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'home.dart';
// import 'settings_page.dart';
// import 'teams_page.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() {
//     return HomeState();
//   }
// }
//
// class HomeState extends State<HomePage> {
//   int index =0;
//   var whichPage = [
//     const HomePage(),
//     const CampaignPage(),
//     const TeamsPage(),
//     const SettingsPage(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         extendBody: true,
//         body: whichPage[index],
//         floatingActionButton: FloatingActionButton(
//         onPressed: () {
//       Navigator.push(context,
//           MaterialPageRoute(builder: (context) => const CreatePage()));
//     },
//     child: Icon(Icons.add
//     , color: index == 0 ? Colors.green : Colors.white70),),
//     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     bottomNavigationBar: BottomNavigationBar(
//     currentIndex: index,
//     items:  [
//     BottomNavigationBarItem(
//     icon: Icon(Icons.home
//     ,color: index == 0 ? Colors.green : Colors.white70),
//     label: 'Home',
//     backgroundColor: Colors.white),
//     BottomNavigationBarItem(
//     icon: Icon(Icons.volume_down_sharp
//     ,color: index == 1 ? Colors.green : Colors.white70),
//     label: 'Campaigns',
//     backgroundColor: Colors.white),
//     BottomNavigationBarItem(
//     icon: Icon(Icons.people_outline,
//     color: index == 2? Colors.green : Colors.white70),
//     label: 'Teams',
//     backgroundColor: Colors.white,
//     ),
//     BottomNavigationBarItem(
//     icon: Icon(Icons.settings,color: index == 3 ? Colors.green : Colors.white70),
//     label: 'Settings',
//     backgroundColor: Colors.white),
//     ],
//     onTap: (ind) {
//     index = ind;
//     setState(() {});
//     },));
//
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CampaignPage extends StatefulWidget {
  const CampaignPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CampaignState();
  }
}

class _CampaignState extends State<CampaignPage> {
  List<Campaign> words = [
    Campaign("Today", "Campaign Name 1", "ABC Stadium,Chennai"),
    Campaign("Tomorrow", "Campaign Name 2", "GBS mahal Velacherry"),
    Campaign("25 Sep 2021", "Campaign Name 3", "ABC Stadium,Tenampet"),
    Campaign("26 Sep 2021", "Campaign Name 4", "ABC Stadium,Tenampet"),
    Campaign("27 Sep 2021 ", "Campaign Name 5", "ABC Stadium,Chennai"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 10, 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "All Campaigns",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    " Explore all campaigns",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.all(15),
                          itemCount: words.length,
                          itemBuilder: (context, index) {
                            return Card(
                                shadowColor: Colors.white60,
                                elevation: 20,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: ListTile(
                                    title: Text(
                                      words[index].day,
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.black),
                                    ),
                                    contentPadding: const EdgeInsets.all(15),
                                    subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            words[index].name,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: Row(children: [
                                                const Icon(
                                                  Icons.location_on,
                                                  size: 15,
                                                  color: Colors.black54,
                                                ),
                                                Text(
                                                  words[index].location,
                                                  style: const TextStyle(
                                                      color: Colors.black54),
                                                ),
                                              ]))
                                        ])));
                          }))
                ])));
  }
}

class Campaign {
  final String day, name, location;

  Campaign(this.day, this.name, this.location);
}
