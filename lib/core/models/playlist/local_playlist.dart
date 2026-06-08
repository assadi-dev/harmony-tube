import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:harmony_tube/core/models/local_track.dart';
import 'package:harmony_tube/core/utils/generator.dart';

part 'local_playlist.freezed.dart';
part 'local_playlist.g.dart';

@freezed
class PlaylistItemModel with _$PlaylistItemModel {
  const factory PlaylistItemModel({
    required String id,
    required String title,
    String? cover,
    @Default(<TrackItemModel>[]) List<TrackItemModel> tracks,
    @Default(0) int nbTracks,
    String? description,
    DateTime? lastPlayedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _PlaylistItemModel;

  factory PlaylistItemModel.fromJson(Map<String, dynamic> json) =>
      _$PlaylistItemModelFromJson(json);

  factory PlaylistItemModel.generate({
    required String title,
    String? description,
    String? cover,
    List<TrackItemModel>? tracks,
    int? nbTracks,
  }) {
    final now = DateTime.now();
    return PlaylistItemModel(
      id: generateId(),
      title: title.isEmpty ? 'playlist_${now.millisecondsSinceEpoch}' : title,
      description: description,
      cover: cover,
      tracks: tracks ?? const [],
      nbTracks: nbTracks ?? tracks?.length ?? 0,
      createdAt: now,
      updatedAt: now,
    );
  }
}
