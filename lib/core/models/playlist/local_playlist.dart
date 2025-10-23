import 'package:harmony_tube/core/models/local_track.dart';
import 'package:harmony_tube/core/utils/generator.dart';



class PlaylistItemModel {
  final String id;
  final String title;
  final String? cover;
  final List<TrackItemModel>? tracks;
  final int nbTracks;
  final String? description;
  final DateTime? lastPlayedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;



  PlaylistItemModel({
    required this.id,
    required this.title,
    this.description,
    this.cover,
    this.tracks,
    this.nbTracks = 0,
    this.lastPlayedAt,
    this.createdAt,
    this.updatedAt,

  });



  factory PlaylistItemModel.generate(dynamic entries) {
    final DateTime now = DateTime.now();

    return PlaylistItemModel(
      id: generateId(),
      title:  entries.title ?? 'playlist_${now.millisecond}',
      description:  entries.description ?? null,
      cover:  entries.cover ?? null,
      tracks:  entries.tracks ?? null,
      nbTracks:  entries.nbTracks ?? 0,
      createdAt: now,
      updatedAt: now,
    );

  }

  PlaylistItemModel copyWith(dynamic entries) {
    final dateNow = DateTime.now();

    return PlaylistItemModel(
      id: id,
      title: entries.title ?? title,
      description: entries.description ?? description,
      cover: entries.cover ?? cover,
      tracks: entries.tracks ?? tracks,
      nbTracks: entries.nbTracks ?? nbTracks,
      lastPlayedAt: entries.lastPlayedAt ?? lastPlayedAt,
      createdAt: createdAt,
      updatedAt: dateNow,
    );
  }


}




