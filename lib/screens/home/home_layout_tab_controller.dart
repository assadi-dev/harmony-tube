import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:harmony_tube/config/app_config.dart';
import 'package:harmony_tube/screens/home_screen.dart';
import 'package:harmony_tube/screens/playlist_screen.dart';
import 'package:harmony_tube/widgets/app_text_theme.dart';

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
            contentCenter: true,
            labelSpacing: 5,
            tabs: [
              Tab(text: "Accueil", icon: Icon(Icons.home_outlined, size: 18)),
              Tab(
                text: "Bibliothèque",
                icon: Icon(Icons.library_music_outlined, size: 18),
              ),
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

class TabTextAlignement extends StatelessWidget {
  final IconData icon;
  final String text;

  const TabTextAlignement({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 5,
      children: [Icon(icon), AppTextTheme(text)],);
  }

}