

import 'package:flutter/material.dart';
import 'package:harmony_tube/screens/PlaylistDetailScreen.dart';
import 'package:harmony_tube/screens/home/home_layout_tab_controller.dart';
import 'package:harmony_tube/screens/playlist_screen.dart';


class RouterObject {
  final String path;
  final String title;
  final Widget widget;
  final String name;
  final dynamic extras;

  RouterObject(
      {required this.name,
        required this.path,
        required this.title,
        this.extras,
        this.widget = const Placeholder()});
}

class RouterPath {
  static RouterObject home = RouterObject(
      name: "home",
      path: '/home',
      title: "Accueil",
      widget:  HomeLayoutTabController());
  static RouterObject search =
  RouterObject(name: "search", path: '/search', title: "Rechercher");
  static RouterObject library = RouterObject(
      name: "library",
      path: '/library',
      title: "Bibliothèque",
      widget: const PlaylistScreen());

  static RouterObject playlistDetail = RouterObject(
      name: "playlist-detail",
      path: "/playlist/detail",
      title: "Playlist Detail",
      widget: const Placeholder());
  static RouterObject settings =
  RouterObject(name: "settings", path: '/settings', title: "Réglages");
}
