import 'package:harmony_tube/core/errors/result.dart';
import 'package:harmony_tube/core/models/local_track.dart';

abstract class TrackRepository {
  Future<Result<List<TrackItemModel>>> all();

  Future<Result<TrackItemModel>> find({required String trackId});

  Future<Result<void>> save(TrackItemModel track);

  Future<Result<void>> delete({required String trackId});
}
