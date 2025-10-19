

import 'dart:math';
import 'package:harmony_tube/screens/playlist_screens/models/model.dart';


  List<PlaylistItem> playlistMockData() {
    final List<PlaylistItem> items = [];  final Random random = Random();
    final List<String> randomTitles = [
      'Ambiance estivale',
      'Concentration profonde',
      'Motivation maximale',
      'Détente absolue',
      'Nostalgie des années 90',
      'Soirée rock endiablée',
      'Voyage introspectif',
      'Énergie matinale',
      'Ballades romantiques',
      'Exploration électronique'
    ];

    for (int i = 0; i < 10; i++) {
      items.add(
        PlaylistItem(
          id: i.toString(),
         title: randomTitles[random.nextInt(randomTitles.length)],
          totalTracks: random.nextInt(100),
        ),
      );
    }
    return items;
  }

