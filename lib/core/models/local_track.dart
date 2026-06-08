import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:harmony_tube/core/utils/generator.dart';

part 'local_track.freezed.dart';
part 'local_track.g.dart';

@freezed
class TrackItemModel with _$TrackItemModel {
  const factory TrackItemModel({
    required String id,
    required String title,
    @Default('unknown') String? artist,
    required int duration,
    String? youtubeId,
    String? path,
    String? year,
    String? album,
    String? artwork,
    DateTime? lastPlayedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _TrackItemModel;

  factory TrackItemModel.fromJson(Map<String, dynamic> json) =>
      _$TrackItemModelFromJson(json);

  factory TrackItemModel.generate(Map<String, dynamic> entries) {
    final now = DateTime.now();
    return TrackItemModel(
      id: generateId(),
      title: entries['title'] as String,
      artist: entries['artist'] as String? ?? 'unknown',
      duration: (entries['durationMs'] as int?) ?? 0,
      youtubeId: entries['youtubeId'] as String?,
      path: entries['path'] as String?,
      year: entries['year'] as String?,
      album: entries['album'] as String?,
      artwork: entries['artwork'] as String?,
      createdAt: now,
      updatedAt: now,
    );
  }
}
