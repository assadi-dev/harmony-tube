import 'package:equatable/equatable.dart';
import 'package:harmony_tube/modules/home/model/youtube_categories.dart';

class CategoriesEvent extends Equatable {
  final YoutubeCategory? selected;
  const CategoriesEvent({this.selected});

  @override
  List<Object?> get props => [selected!];
}

class LoadCategoriesCollectionsEvent extends CategoriesEvent {
  final YoutubeCategory? category;
  const LoadCategoriesCollectionsEvent({this.category});
}
