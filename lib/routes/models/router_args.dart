import 'package:harmony_tube/core/models/local_playlist.dart';
import 'package:harmony_tube/screens/playlist_screens/models/model.dart';

class PlaylistDetailExtra {
  final String id;
  String? title;
  String? imgSrc;

  PlaylistDetailExtra({required this.id, this.title, this.imgSrc});


  factory PlaylistDetailExtra.fromPlaylistItem(PlaylistItem item) {
    return PlaylistDetailExtra(
        id: item.id, title: item.title , imgSrc: item.imageUrl);
  }

  factory PlaylistDetailExtra.fromPlaylistItemModel(PlaylistItemModel item) {
    return PlaylistDetailExtra(
        id: item.id, title: item.name , imgSrc: item.cover );
  }


}


