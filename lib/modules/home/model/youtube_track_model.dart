class YoutubeTrackModel {
  final String title;
  final String videoId;
  final String videoType;
  final String thumbnails;
  final bool isExplicit;
  final String artists;
  final String album;
  final String duration;

  YoutubeTrackModel({
    required this.title,
    required this.videoId,
    required this.videoType,
    required this.thumbnails,
    required this.isExplicit,
    required this.artists,
    required this.album,
    required this.duration,
  });

  factory YoutubeTrackModel.fromJson(Map<String, dynamic> json) {
    return YoutubeTrackModel(
      title: json['title'],
      videoId: json['videoId'],
      videoType: json['videoType'],
      thumbnails: json['thumbnails'],
      isExplicit: json['isExplicit'],
      artists: json['artists'],
      album: json['album'],
      duration: json['duration'],
    );
  }
}
