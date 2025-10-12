import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:harmony_tube/config/app_config.dart';
import 'package:harmony_tube/screens/home_screen.dart';
import 'package:harmony_tube/screens/playlist_screen.dart';

class HomeLayoutTabController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeLayoutTabState();
}

class HomeLayoutTabState extends State<HomeLayoutTabController>   with SingleTickerProviderStateMixin {
   late TabController _tabController;
   late List<Widget> tabsViewList = [];

   @override
   void initState() {
     super.initState();
     tabsViewList = [HomeScreen(), PlaylistScreen()];
     _tabController = TabController(length: tabsViewList.length, vsync: this);

   }


   @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabsViewList.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(app_title),
          bottom: ButtonsTabBar(
            controller: _tabController,
              unselectedBackgroundColor: Colors.transparent,
contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 22),

            tabs: [
              Tab(text: "Accueil", icon: Icon(Icons.home_max_outlined)),
              Tab(text: "Bibliothèque", icon: Icon(Icons.library_books_outlined)),
            ],

          ),
        ),

        body: TabBarView(
          controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: tabsViewList),
      ),

    );
  }
}