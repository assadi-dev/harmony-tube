import 'package:harmony_tube/core/models/local_track.dart';
import 'package:harmony_tube/core/utils/generator.dart';



class PlaylistItemModel {
  final String id;
  final String name;
  final String? cover;
  final List<TrackItemModel>? tracks;
  final int nbTracks;
  final String? description;
  final DateTime? lastPlayedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;



  PlaylistItemModel({
    required this.id,
    required this.name,
    this.description,
    this.cover,
    this.tracks,
    this.nbTracks = 0,
    this.lastPlayedAt,
    this.createdAt,
    this.updatedAt,

  });



  factory PlaylistItemModel.generate(dynamic entries) {

    final dateNow = DateTime.now();

    return PlaylistItemModel(
      id: generateId(),
      name: entries['name'],
      description: entries['description'],
      cover: entries['cover'],
      tracks: entries['tracks'] ?? [],
      nbTracks: entries['nbTracks'] ?? 0,
      createdAt: dateNow,
      updatedAt: dateNow,
    );

  }

  PlaylistItemModel copyWith(dynamic entries) {
    final dateNow = DateTime.now();

    return PlaylistItemModel(
      id: id,
      name: entries['name'] ?? name,
      description: entries['description'] ?? description,
      cover: entries['cover'] ?? cover,
      tracks: entries['tracks'] ?? tracks,
      nbTracks: entries['nbTracks'] ?? nbTracks,
      lastPlayedAt: entries['lastPlayedAt'] ?? lastPlayedAt,
      createdAt: createdAt,
      updatedAt: dateNow,
    );
  }


}




