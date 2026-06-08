// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaylistItemModelImpl _$$PlaylistItemModelImplFromJson(
  Map<String, dynamic> json,
) => _$PlaylistItemModelImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  cover: json['cover'] as String?,
  tracks:
      (json['tracks'] as List<dynamic>?)
          ?.map((e) => TrackItemModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <TrackItemModel>[],
  nbTracks: (json['nbTracks'] as num?)?.toInt() ?? 0,
  description: json['description'] as String?,
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

Map<String, dynamic> _$$PlaylistItemModelImplToJson(
  _$PlaylistItemModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'cover': instance.cover,
  'tracks': instance.tracks,
  'nbTracks': instance.nbTracks,
  'description': instance.description,
  'lastPlayedAt': instance.lastPlayedAt?.toIso8601String(),
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
