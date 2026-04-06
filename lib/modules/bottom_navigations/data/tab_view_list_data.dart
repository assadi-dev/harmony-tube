import 'package:flutter/material.dart';
import 'package:harmony_tube/screens/home_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class TabViewListData {
  static List<PersistentTabConfig> tabs() => [
    PersistentTabConfig(
      screen: const HomeScreen(),
      item: ItemConfig(icon: const Icon(Icons.home), title: "Accueil"),
    ),
    PersistentTabConfig(
      screen: const Placeholder(),
      item: ItemConfig(icon: const Icon(Icons.explore), title: "Explorer"),
    ),
    PersistentTabConfig(
      screen: const Placeholder(),
      item: ItemConfig(
        icon: const Icon(Icons.library_music),
        title: "Bibliothèque",
      ),
    ),
    PersistentTabConfig(
      screen: const Placeholder(),
      item: ItemConfig(icon: const Icon(Icons.settings), title: "Réglages"),
    ),
  ];
}
