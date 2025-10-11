import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:harmony_flow/config/app_config.dart';
import 'package:harmony_flow/screens/home_screen.dart';
import 'package:harmony_flow/screens/playlist_screen.dart';

class HomeLayoutTabController extends StatelessWidget {
   HomeLayoutTabController({super.key});

  final List<Widget> tabsViewList = [HomeScreen(), PlaylistScreen()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabsViewList.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(app_title),
          bottom: ButtonsTabBar(
              unselectedBackgroundColor: Colors.transparent,
contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 22),

            tabs: [
              Tab(text: "Accueil", icon: Icon(Icons.home_max_outlined)),
              Tab(text: "Bibliothèque", icon: Icon(Icons.library_books_outlined)),
            ],

          ),
        ),

        body: Expanded(child: TabBarView(children: tabsViewList)),
      ),

    );
  }
}