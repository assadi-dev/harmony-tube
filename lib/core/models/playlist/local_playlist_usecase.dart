import 'package:harmony_tube/core/errors/failure.dart';
import 'package:harmony_tube/core/errors/result.dart';
import 'package:harmony_tube/core/models/local_track.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist_repository.dart';

class PlaylistUsecase {
  final PlaylistRepository playlistRepository;
  final PlaylistTrackRepository playlistTrackRepository;

  PlaylistUsecase({
    required this.playlistRepository,
    required this.playlistTrackRepository,
  });

  Future<Result<List<PlaylistItemModel>>> getPlaylistItems() async {
    try {
      return await playlistRepository.all();
    } catch (e, st) {
      return Result.failure(
        UnknownFailure(
          message: 'Erreur lors du chargement des playlists',
          cause: e,
          stackTrace: st,
        ),
      );
    }
  }

  Future<Result<PlaylistItemModel>> findPlaylist(String playlistId) {
    return playlistRepository.find(playlistId: playlistId);
  }

  Future<Result<void>> createPlaylist(PlaylistItemModel playlist) {
    return playlistRepository.save(playlist);
  }

  Future<Result<PlaylistItemModel>> updatePlaylist(PlaylistItemModel playlist) {
    return playlistRepository.update(playlist);
  }

  Future<Result<void>> deletePlaylist(String playlistId) {
    return playlistRepository.delete(playlistId: playlistId);
  }

  Future<Result<PlaylistItemModel>> addTrack({
    required String playlistId,
    required TrackItemModel track,
  }) {
    return playlistTrackRepository.addTrack(
      playlistId: playlistId,
      track: track,
    );
  }

  Future<Result<PlaylistItemModel>> removeTrack({
    required String playlistId,
    required String trackId,
  }) {
    return playlistTrackRepository.removeTrack(
      playlistId: playlistId,
      trackId: trackId,
    );
  }
}
