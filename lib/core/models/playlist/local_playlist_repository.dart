import 'package:harmony_tube/core/errors/result.dart';
import 'package:harmony_tube/core/models/local_track.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist.dart';

abstract class PlaylistRepository {
  Future<Result<void>> save(PlaylistItemModel playlistItem);

  Future<Result<void>> delete({required String playlistId});

  Future<Result<PlaylistItemModel>> update(PlaylistItemModel playlistItem);

  Future<Result<List<PlaylistItemModel>>> all();

  Future<Result<PlaylistItemModel>> find({required String playlistId});

  Future<Result<List<PlaylistItemModel>>> filter({
    String? search,
    List<String>? column,
    String? order,
    int limit,
    int page,
  });
}

abstract class PlaylistTrackRepository {
  Future<Result<List<TrackItemModel>>> getTracks({required String playlistId});

  Future<Result<PlaylistItemModel>> addTrack({
    required String playlistId,
    required TrackItemModel track,
  });

  Future<Result<PlaylistItemModel>> removeTrack({
    required String playlistId,
    required String trackId,
  });
}
