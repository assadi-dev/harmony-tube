class YoutubePlaylistModel {
  final String title;
  final String playlistId;
  final List<YoutubeThumbnail> thumbnails;
  final String description;
  final List<String> contents;

  YoutubePlaylistModel({
    required this.title,
    required this.playlistId,
    required this.thumbnails,
    required this.description,
    required this.contents,
  });
}

class YoutubeThumbnail {
  final String url;
  final int width;
  final int height;

  YoutubeThumbnail({
    required this.url,
    required this.width,
    required this.height,
  });

  factory YoutubeThumbnail.fromJson(Map<String, dynamic> json) {
    return YoutubeThumbnail(
      url: json['url'],
      width: json['width'],
      height: json['height'],
    );
  }
}
