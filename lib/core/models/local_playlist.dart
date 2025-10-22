import 'package:harmony_tube/core/models/local_track.dart';
import 'package:harmony_tube/core/utils/generator.dart';



class PlaylistItemModel {
  final String id;
  final String name;
  final String? cover;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<TrackItemModel>? tracks;

  PlaylistItemModel({
    required this.id,
    required this.name,
    this.cover,
    this.createdAt,
    this.updatedAt,
    this.tracks,
  });

  factory PlaylistItemModel.generate(Map<String, dynamic> entries) {

    final dateNow = DateTime.now();

    return PlaylistItemModel(
      id: generateId(),
      name: entries['name'],
      cover: entries['cover'],
      tracks: entries['tracks'] ?? [],
      createdAt: dateNow,
      updatedAt: dateNow,
    );

  }


}




