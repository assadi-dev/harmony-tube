import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LayoutTabController extends StatelessWidget {
  //final Widget child;
  //const LayoutTabController({super.key, required this.child});

  final StatefulNavigationShell navigationShell;
  const LayoutTabController({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Harmony Flow"),
          bottom: TabBar(

            onTap: (index) {
              print(index);
              navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex,);
            },
            tabs: [
              Tab(text: "Accueil", icon: Icon(Icons.home_max_outlined)),
              Tab(text: "Bibliothèque", icon: Icon(Icons.live_help_outlined)),
            ],
          ),
        ),

        body: navigationShell,
      ),

    );
  }
}
