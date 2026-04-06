import 'package:flutter/material.dart';
import 'package:harmony_tube/modules/bottom_navigations/model/bottom_navigation_item_model.dart';
import 'package:harmony_tube/routes/router_path.dart';

class BottomBarListItems {
  static double bottomNavHeight = 70;

  static List<BottomNavigationItemModel> listItems = [
    BottomNavigationItemModel(
      icon: Icons.home,
      label: RouterPath.home.title,
      path: RouterPath.home.path,
      screen: RouterPath.home.widget,
    ),
    BottomNavigationItemModel(
      icon: Icons.search,
      label: RouterPath.search.title,
      screen: RouterPath.search.widget,
      path: RouterPath.search.path,
    ),
    BottomNavigationItemModel(
      icon: Icons.list_rounded,
      label: RouterPath.library.title,
      path: RouterPath.library.path,
      screen: RouterPath.library.widget,
    ),
    BottomNavigationItemModel(
      icon: Icons.settings,
      label: RouterPath.settings.title,
      screen: RouterPath.settings.widget,
      path: RouterPath.settings.path,
    ),
  ];

  static List<Widget> screens = listItems.map((item) => item.screen).toList();
}
