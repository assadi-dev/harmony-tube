import 'package:freezed_annotation/freezed_annotation.dart';

part 'youtube_track_model.freezed.dart';
part 'youtube_track_model.g.dart';

@freezed
class YoutubeTrackModel with _$YoutubeTrackModel {
  const factory YoutubeTrackModel({
    required String title,
    required String videoId,
    required String videoType,
    required String thumbnails,
    required bool isExplicit,
    required String artists,
    required String album,
    required String duration,
  }) = _YoutubeTrackModel;

  factory YoutubeTrackModel.fromJson(Map<String, dynamic> json) =>
      _$YoutubeTrackModelFromJson(json);
}
