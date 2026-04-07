import 'package:equatable/equatable.dart';
import 'package:harmony_tube/modules/home/model/youtube_categories.dart';

class CategoriesState extends Equatable {
  final List<String> collections;
  final YoutubeCategory? selected;
  final Exception? error;
  final bool isLoading;

  const CategoriesState({
    this.collections = const [],
    this.selected,
    this.error,
    this.isLoading = true,
  });

  CategoriesState copyWith({
    List<String>? collections,
    YoutubeCategory? selected,
    Exception? error,
    bool? isLoading,
  }) {
    return CategoriesState(
      collections: collections ?? this.collections,
      selected: selected ?? this.selected,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [collections, selected, error, isLoading];
}
