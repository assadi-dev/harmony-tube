import 'package:harmony_tube/screens/playlist_screens/models/model.dart';

class PlaylistDetailExtra {
  final String id;
  String? title;
  String? imgSrc;

  PlaylistDetailExtra({required this.id, this.title, this.imgSrc});


  factory PlaylistDetailExtra.fromPlaylistItem(PlaylistItem item) {
    return PlaylistDetailExtra(
        id: item.id, title: item.title ?? "Playlist sans titre", imgSrc: item.imageUrl ?? "");
  }



}


