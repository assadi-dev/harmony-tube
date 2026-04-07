class YoutubeCategory {
  final String title;
  final String params;

  YoutubeCategory({required this.title, required this.params});

  factory YoutubeCategory.fromJson(Map<String, dynamic> json) {
    return YoutubeCategory(title: json['title'], params: json['params']);
  }
}
