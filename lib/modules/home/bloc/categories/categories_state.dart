import 'package:equatable/equatable.dart';
import 'package:harmony_tube/core/errors/failure.dart';
import 'package:harmony_tube/modules/home/model/youtube_categories.dart';

class CategoriesState extends Equatable {
  final List<String> collections;
  final YoutubeCategory? selected;
  final Failure? error;
  final bool isLoading;

  const CategoriesState({
    this.collections = const [],
    this.selected,
    this.error,
    this.isLoading = false,
  });

  CategoriesState copyWith({
    List<String>? collections,
    YoutubeCategory? selected,
    Object? error = _sentinel,
    bool? isLoading,
  }) {
    return CategoriesState(
      collections: collections ?? this.collections,
      selected: selected ?? this.selected,
      error: identical(error, _sentinel) ? this.error : error as Failure?,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [collections, selected, error, isLoading];
}

const Object _sentinel = Object();
