// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrackItemModelImpl _$$TrackItemModelImplFromJson(Map<String, dynamic> json) =>
    _$TrackItemModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      artist: json['artist'] as String? ?? 'unknown',
      duration: (json['duration'] as num).toInt(),
      youtubeId: json['youtubeId'] as String?,
      path: json['path'] as String?,
      year: json['year'] as String?,
      album: json['album'] as String?,
      artwork: json['artwork'] as String?,
      lastPlayedAt: json['lastPlayedAt'] == null
          ? null
          : DateTime.parse(json['lastPlayedAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$TrackItemModelImplToJson(
  _$TrackItemModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'artist': instance.artist,
  'duration': instance.duration,
  'youtubeId': instance.youtubeId,
  'path': instance.path,
  'year': instance.year,
  'album': instance.album,
  'artwork': instance.artwork,
  'lastPlayedAt': instance.lastPlayedAt?.toIso8601String(),
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
