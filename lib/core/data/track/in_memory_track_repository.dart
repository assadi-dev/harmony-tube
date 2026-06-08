import 'package:harmony_tube/core/errors/failure.dart';
import 'package:harmony_tube/core/errors/result.dart';
import 'package:harmony_tube/core/models/local_track.dart';
import 'package:harmony_tube/core/models/track_repository.dart';
import 'package:harmony_tube/mocks/songs.dart';

class InMemoryTrackRepository implements TrackRepository {
  final Map<String, TrackItemModel> _store = {
    for (final t in youtubeTrackMock) t.id: t,
  };

  @override
  Future<Result<List<TrackItemModel>>> all() async {
    return Result.success(_store.values.toList(growable: false));
  }

  @override
  Future<Result<TrackItemModel>> find({required String trackId}) async {
    final track = _store[trackId];
    if (track == null) {
      return Result.failure(
        NotFoundFailure(message: 'Track $trackId introuvable'),
      );
    }
    return Result.success(track);
  }

  @override
  Future<Result<void>> save(TrackItemModel track) async {
    _store[track.id] = track;
    return const Result.success(null);
  }

  @override
  Future<Result<void>> delete({required String trackId}) async {
    if (!_store.containsKey(trackId)) {
      return Result.failure(
        NotFoundFailure(message: 'Track $trackId introuvable'),
      );
    }
    _store.remove(trackId);
    return const Result.success(null);
  }
}
