import 'package:freezed_annotation/freezed_annotation.dart';

part 'youtube_playlist_model.freezed.dart';
part 'youtube_playlist_model.g.dart';

@freezed
class YoutubePlaylistModel with _$YoutubePlaylistModel {
  const factory YoutubePlaylistModel({
    required String title,
    required String playlistId,
    required List<YoutubeThumbnail> thumbnails,
    required String description,
    required List<String> contents,
  }) = _YoutubePlaylistModel;

  factory YoutubePlaylistModel.fromJson(Map<String, dynamic> json) =>
      _$YoutubePlaylistModelFromJson(json);
}

@freezed
class YoutubeThumbnail with _$YoutubeThumbnail {
  const factory YoutubeThumbnail({
    required String url,
    required int width,
    required int height,
  }) = _YoutubeThumbnail;

  factory YoutubeThumbnail.fromJson(Map<String, dynamic> json) =>
      _$YoutubeThumbnailFromJson(json);
}
