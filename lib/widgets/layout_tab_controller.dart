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

        body: navigationShell,
      ),

    );
  }
}
