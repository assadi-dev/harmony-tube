import 'package:equatable/equatable.dart';
import 'package:harmony_tube/core/errors/failure.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist.dart';

class PlaylistState extends Equatable {
  final List<PlaylistItemModel> collections;
  final PlaylistItemModel? playlist;
  final Failure? error;
  final bool isLoading;

  const PlaylistState({
    this.collections = const [],
    this.playlist,
    this.error,
    this.isLoading = false,
  });

  PlaylistState copyWith({
    List<PlaylistItemModel>? collections,
    Object? playlist = _sentinel,
    Object? error = _sentinel,
    bool? isLoading,
  }) {
    return PlaylistState(
      collections: collections ?? this.collections,
      playlist: identical(playlist, _sentinel)
          ? this.playlist
          : playlist as PlaylistItemModel?,
      error: identical(error, _sentinel) ? this.error : error as Failure?,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [collections, playlist, error, isLoading];
}

const Object _sentinel = Object();
