

import 'dart:math';
import 'package:harmony_tube/core/models/playlist/local_playlist.dart';
import 'package:harmony_tube/core/models/local_track.dart';
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


List<PlaylistItemModel> playlistItemsMock() {
  final List<PlaylistItemModel> items = [];
  final Random random = Random();
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

  final List<TrackItemModel> tracks = [];



  for (int i = 0; i < 10; i++) {
    final playlistItemModel = PlaylistItemModel.generate(
      {

        'name': randomTitles[random.nextInt(randomTitles.length)],
        'totalTracks': tracks.length,
        'tracks': tracks,
        'cover': 'https://picsum.photos/300/300?random=$i',
        'description': 'Description de la playlist $i',

      }

);
    items.add(
        playlistItemModel
    );
  }
  return items;
}


class PlaylistMock {
  static List<PlaylistItemModel> playlists = [];
  PlaylistMock(){
      playlists = playlistItemsMock();

  }


    static List<PlaylistItemModel> getPlaylist() {
      playlists = playlistItemsMock();
      return playlists;
    }

    static void addPlaylist(PlaylistItemModel playlistItemModel) {
      playlists.add(playlistItemModel);
    }

    static void removePlaylist(PlaylistItemModel playlistItemModel) {
      playlists.remove(playlistItemModel);
    }

static PlaylistItemModel? findPlaylist(String id) {
    if (playlists.isEmpty) {
      playlists = playlistItemsMock();
    }

    final playlist = playlists.firstWhere((playlist) => playlist.id == id);
    return playlist;

}





}