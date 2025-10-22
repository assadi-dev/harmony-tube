import 'package:harmony_tube/core/utils/generator.dart';


class TrackItemModel  {
  final String id;
  final String title;
  String? artist;
  String? album;
  String? year;
  String? artwork;
  /**
   * Duration in milliseconds
   */
  final int duration;
  String? youtubeId;
  String? path;
  DateTime? lastPlayedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  TrackItemModel({
    required this.id,
    required this.title,
    this.artist = "unknown",
    required this.duration,
    this.youtubeId,
    this.path,
    this.year,
    this.album,
    this.artwork,
    this.lastPlayedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory TrackItemModel.generate(Map<String,dynamic> entries) {
    final dateNow = DateTime.now();

    return TrackItemModel(
      id: generateId(),
      title: entries["title"],
      artist: entries["artist"] ?? "unknown",
      duration: entries["durationMs"] ?? 0,
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
