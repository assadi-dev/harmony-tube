import 'package:harmony_tube/core/utils/generator.dart';


class TrackItemModel  {
  String id;
  String title;
  String artist;
  String? album;
  String? year;
  String? artwork;
  /**
   * Duration in milliseconds
   */
  int duration;
  String? youtubeId;
  String? path;
  DateTime? createdAt;
  DateTime? updatedAt;

  TrackItemModel({
    required this.id,
    this.title = "unknown",
    this.artist = "unknown",
    this.duration = 0,
    this.youtubeId,
    this.path,
    this.year,
    this.album,
    this.artwork,
    this.createdAt,
    this.updatedAt,
  });

  factory TrackItemModel.generate(Map<String,dynamic> entries) {
    final dateNow = DateTime.now();

    return TrackItemModel(
      id: generateId(),
      title: entries["title"],
      artist: entries["artist"],
      duration: entries["durationMs"],
      youtubeId: entries["youtubeId"],
      path: entries["path"],
      year: entries["year"],
      album: entries["album"],
      artwork: entries["artwork"],
      createdAt: dateNow,
      updatedAt: dateNow,
    );

  }


}
