// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_track_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$YoutubeTrackModelImpl _$$YoutubeTrackModelImplFromJson(
  Map<String, dynamic> json,
) => _$YoutubeTrackModelImpl(
  title: json['title'] as String,
  videoId: json['videoId'] as String,
  videoType: json['videoType'] as String,
  thumbnails: json['thumbnails'] as String,
  isExplicit: json['isExplicit'] as bool,
  artists: json['artists'] as String,
  album: json['album'] as String,
  duration: json['duration'] as String,
);

Map<String, dynamic> _$$YoutubeTrackModelImplToJson(
  _$YoutubeTrackModelImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'videoId': instance.videoId,
  'videoType': instance.videoType,
  'thumbnails': instance.thumbnails,
  'isExplicit': instance.isExplicit,
  'artists': instance.artists,
  'album': instance.album,
  'duration': instance.duration,
};
