import 'package:equatable/equatable.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist.dart';

class PlaylistState extends Equatable {
  final List<PlaylistItemModel>? collections;
  final PlaylistItemModel? playlist;
  final Exception? error;
  final bool isLoading;

  const PlaylistState({
    this.collections=const[],
    this.playlist,
    this.error,
    this.isLoading = true,
  });

  PlaylistState copyWith({
    List<PlaylistItemModel>? collections,
    PlaylistItemModel? playlist,
    Exception? error,
    bool? isLoading,
}) {
    return PlaylistState(
      collections: collections ?? this.collections,
      playlist: playlist ?? this.playlist,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [collections, playlist, error, isLoading];
}




