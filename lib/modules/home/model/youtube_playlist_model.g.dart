// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_playlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YoutubePlaylistModelImpl _$$YoutubePlaylistModelImplFromJson(
  Map<String, dynamic> json,
) => _$YoutubePlaylistModelImpl(
  title: json['title'] as String,
  playlistId: json['playlistId'] as String,
  thumbnails: (json['thumbnails'] as List<dynamic>)
      .map((e) => YoutubeThumbnail.fromJson(e as Map<String, dynamic>))
      .toList(),
  description: json['description'] as String,
  contents: (json['contents'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$$YoutubePlaylistModelImplToJson(
  _$YoutubePlaylistModelImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'playlistId': instance.playlistId,
  'thumbnails': instance.thumbnails,
  'description': instance.description,
  'contents': instance.contents,
};

_$YoutubeThumbnailImpl _$$YoutubeThumbnailImplFromJson(
  Map<String, dynamic> json,
) => _$YoutubeThumbnailImpl(
  url: json['url'] as String,
  width: (json['width'] as num).toInt(),
  height: (json['height'] as num).toInt(),
);

Map<String, dynamic> _$$YoutubeThumbnailImplToJson(
  _$YoutubeThumbnailImpl instance,
) => <String, dynamic>{
  'url': instance.url,
  'width': instance.width,
  'height': instance.height,
};
