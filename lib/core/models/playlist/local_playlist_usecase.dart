
import 'package:harmony_tube/core/models/playlist/local_playlist.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist_repository.dart';

class PlaylistUsecase {
  final PlaylistItemRepository playlistRepository;
  PlaylistUsecase({required this.playlistRepository}) ;

  Future<List<PlaylistItemModel>> getPlaylistItems() async {
    try {
      final playlistItems = await playlistRepository.all();
      return playlistItems;
    }catch(e){
      throw Exception(e);
    }

  }



}