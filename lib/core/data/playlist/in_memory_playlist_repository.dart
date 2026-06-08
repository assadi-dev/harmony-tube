import 'package:harmony_tube/core/errors/failure.dart';
import 'package:harmony_tube/core/errors/result.dart';
import 'package:harmony_tube/core/models/local_track.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist_repository.dart';

class InMemoryPlaylistRepository
    implements PlaylistRepository, PlaylistTrackRepository {
  final Map<String, PlaylistItemModel> _store = {};

  @override
  Future<Result<List<PlaylistItemModel>>> all() async {
    return Result.success(_store.values.toList(growable: false));
  }

  @override
  Future<Result<PlaylistItemModel>> find({required String playlistId}) async {
    final playlist = _store[playlistId];
    if (playlist == null) {
      return Result.failure(
        NotFoundFailure(message: 'Playlist $playlistId introuvable'),
      );
    }
    return Result.success(playlist);
  }

  @override
  Future<Result<void>> save(PlaylistItemModel playlistItem) async {
    if (_store.containsKey(playlistItem.id)) {
      return Result.failure(
        ValidationFailure(
          message: 'Playlist ${playlistItem.id} existe déjà',
        ),
      );
    }
    _store[playlistItem.id] = playlistItem;
    return const Result.success(null);
  }

  @override
  Future<Result<PlaylistItemModel>> update(
    PlaylistItemModel playlistItem,
  ) async {
    if (!_store.containsKey(playlistItem.id)) {
      return Result.failure(
        NotFoundFailure(message: 'Playlist ${playlistItem.id} introuvable'),
      );
    }
    final updated = playlistItem.copyWith(updatedAt: DateTime.now());
    _store[playlistItem.id] = updated;
    return Result.success(updated);
  }

  @override
  Future<Result<void>> delete({required String playlistId}) async {
    if (!_store.containsKey(playlistId)) {
      return Result.failure(
        NotFoundFailure(message: 'Playlist $playlistId introuvable'),
      );
    }
    _store.remove(playlistId);
    return const Result.success(null);
  }

  @override
  Future<Result<List<PlaylistItemModel>>> filter({
    String? search,
    List<String>? column,
    String? order,
    int limit = 20,
    int page = 0,
  }) async {
    Iterable<PlaylistItemModel> items = _store.values;

    if (search != null && search.isNotEmpty) {
      final needle = search.toLowerCase();
      items = items.where(
        (p) =>
            p.title.toLowerCase().contains(needle) ||
            (p.description?.toLowerCase().contains(needle) ?? false),
      );
    }

    final list = items.toList();
    if (order == 'desc') {
      list.sort((a, b) => b.title.compareTo(a.title));
    } else if (order == 'asc') {
      list.sort((a, b) => a.title.compareTo(b.title));
    }

    final start = page * limit;
    if (start >= list.length) {
      return const Result.success(<PlaylistItemModel>[]);
    }
    final end = (start + limit).clamp(0, list.length);
    return Result.success(list.sublist(start, end));
  }

  @override
  Future<Result<List<TrackItemModel>>> getTracks({
    required String playlistId,
  }) async {
    final playlist = _store[playlistId];
    if (playlist == null) {
      return Result.failure(
        NotFoundFailure(message: 'Playlist $playlistId introuvable'),
      );
    }
    return Result.success(playlist.tracks);
  }

  @override
  Future<Result<PlaylistItemModel>> addTrack({
    required String playlistId,
    required TrackItemModel track,
  }) async {
    final playlist = _store[playlistId];
    if (playlist == null) {
      return Result.failure(
        NotFoundFailure(message: 'Playlist $playlistId introuvable'),
      );
    }
    final newTracks = [...playlist.tracks, track];
    final updated = playlist.copyWith(
      tracks: newTracks,
      nbTracks: newTracks.length,
      updatedAt: DateTime.now(),
    );
    _store[playlistId] = updated;
    return Result.success(updated);
  }

  @override
  Future<Result<PlaylistItemModel>> removeTrack({
    required String playlistId,
    required String trackId,
  }) async {
    final playlist = _store[playlistId];
    if (playlist == null) {
      return Result.failure(
        NotFoundFailure(message: 'Playlist $playlistId introuvable'),
      );
    }
    final newTracks =
        playlist.tracks.where((t) => t.id != trackId).toList(growable: false);
    final updated = playlist.copyWith(
      tracks: newTracks,
      nbTracks: newTracks.length,
      updatedAt: DateTime.now(),
    );
    _store[playlistId] = updated;
    return Result.success(updated);
  }
}
