import 'package:flutter/material.dart';
import 'package:harmony_tube/modules/home/screen.dart';
import 'package:harmony_tube/screens/playlist_screen.dart';

class RouterObject {
  final String path;
  final String title;
  final Widget widget;
  final String name;
  final dynamic extras;

  RouterObject({
    required this.name,
    required this.path,
    required this.title,
    this.extras,
    this.widget = const Placeholder(),
  });
}

class RouterPath {
  static RouterObject home = RouterObject(
    name: "home",
    path: '/home',
    title: "Accueil",
    widget: HomeScreen(),
  );
  static RouterObject explorer = RouterObject(
    name: "explorer",
    path: '/explorer',
    title: "Explorer",
    widget: const Placeholder(),
  );
  static RouterObject library = RouterObject(
    name: "library",
    path: '/library',
    title: "Bibliothèque",
    widget: const PlaylistScreen(),
  );

  static RouterObject playlistDetail = RouterObject(
    name: "playlist-detail",
    path: "/playlist/detail",
    title: "Playlist Detail",
    widget: const Placeholder(),
  );
  static RouterObject settings = RouterObject(
    name: "settings",
    path: '/settings',
    title: "Réglages",
  );
}
