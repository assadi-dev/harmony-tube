import 'package:harmony_tube/core/errors/result.dart';
import 'package:harmony_tube/core/models/local_track.dart';
import 'package:harmony_tube/core/models/track_repository.dart';

class TrackUsecase {
  final TrackRepository trackRepository;

  TrackUsecase({required this.trackRepository});

  Future<Result<List<TrackItemModel>>> getAllTracks() {
    return trackRepository.all();
  }

  Future<Result<TrackItemModel>> findTrack(String trackId) {
    return trackRepository.find(trackId: trackId);
  }

  Future<Result<void>> addTrack(TrackItemModel track) {
    return trackRepository.save(track);
  }

  Future<Result<void>> removeTrack(String trackId) {
    return trackRepository.delete(trackId: trackId);
  }
}
