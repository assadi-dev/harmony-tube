import 'package:equatable/equatable.dart';
import 'package:harmony_tube/core/errors/failure.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist.dart';

class PlaylistTracksState extends Equatable {
  final PlaylistItemModel? lastUpdated;
  final Failure? error;
  final bool isLoading;

  const PlaylistTracksState({
    this.lastUpdated,
    this.error,
    this.isLoading = false,
  });

  PlaylistTracksState copyWith({
    Object? lastUpdated = _sentinel,
    Object? error = _sentinel,
    bool? isLoading,
  }) {
    return PlaylistTracksState(
      lastUpdated: identical(lastUpdated, _sentinel)
          ? this.lastUpdated
          : lastUpdated as PlaylistItemModel?,
      error: identical(error, _sentinel) ? this.error : error as Failure?,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [lastUpdated, error, isLoading];
}

const Object _sentinel = Object();
