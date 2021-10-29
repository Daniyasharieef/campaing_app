import 'package:campaign_app/page/save_page.dart';
import 'package:campaign_app/page/settings_page.dart';
import 'package:campaign_app/page/teams_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'campaign.dart';
import 'create_page.dart';
import 'home.dart';
import 'package:campaign_app/page/campaign.dart';
import 'package:campaign_app/page/create_page.dart';
import 'package:campaign_app/page/home.dart';



class HomeTabPage extends StatefulWidget {
  const HomeTabPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeTabState();
  }
}

class _HomeTabState extends State<HomeTabPage> {
  int _selectedIndex = 0;


final  List<Widget>_widgetOptions =<Widget>[
    const HomePage(),
    const CampaignPage(),
    const TeamsPage(),
    const SettingsPage(),
    const CreatePage(),
    const SavePage(),
  ];

void _onItemTapped (int index){
  setState(() {
    _selectedIndex =index;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: _widgetOptions[_selectedIndex],
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerDocked,
        floatingActionButton:
        FloatingActionButton(
             backgroundColor: Colors.orange[800],
          onPressed: () {
            _onItemTapped(4);
          },

          child:const Icon(Icons.add,
              size: 20, color: Colors.white),
        ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined,
              color: _selectedIndex == 0? Colors.green : Colors.black54),
      label: 'Home',),

              BottomNavigationBarItem(
                icon: Icon(Icons.campaign_outlined,
                    color: _selectedIndex == 1? Colors.green : Colors.black54),
                label: 'Campaigns',),
              BottomNavigationBarItem(
                icon: Icon(Icons.people_outline,
                    color: _selectedIndex == 2 ? Colors.green : Colors.black54),
                label: 'Teams',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined,
                    color: _selectedIndex == 3 ? Colors.green : Colors.black54),
                label: 'Settings',
              ),

            ],
            onTap: _onItemTapped,

          )
      );
  }}


