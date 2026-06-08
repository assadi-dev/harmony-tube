import 'package:freezed_annotation/freezed_annotation.dart';

part 'youtube_categories.freezed.dart';
part 'youtube_categories.g.dart';

@freezed
class YoutubeCategory with _$YoutubeCategory {
  const factory YoutubeCategory({
    required String title,
    required String params,
  }) = _YoutubeCategory;

  factory YoutubeCategory.fromJson(Map<String, dynamic> json) =>
      _$YoutubeCategoryFromJson(json);
}

const defaultCategory = YoutubeCategory(title: 'Toutes', params: 'all');
