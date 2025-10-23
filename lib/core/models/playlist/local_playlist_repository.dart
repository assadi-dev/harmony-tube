import 'package:harmony_tube/core/models/local_track.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist.dart';

abstract class PlaylistItemRepository {
  Future<void> save(PlaylistItemModel playlistItem);

  Future<void> delete({required String playlistId});

  Future<void> update(PlaylistItemModel playlistItem);

  Future<List<PlaylistItemModel>> all();

  Future<PlaylistItemModel?> find({required String playlistId});

  Future<List<PlaylistItemModel>> filter({
    String? search,
    List<String>? column,
    String? order,
    int limit,
    int page,
  });

  Future<void> getTracks({required String playlistId});

  Future<void> addTrack({
    required String playlistId,
    required TrackItemModel track,
  });

  Future<void> removeTrack({
    required String playlistId,
    required String trackId,
  });
}
