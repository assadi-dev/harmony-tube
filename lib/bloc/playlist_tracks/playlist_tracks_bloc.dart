import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/bloc/playlist_tracks/playlist_tracks_event.dart';
import 'package:harmony_tube/bloc/playlist_tracks/playlist_tracks_state.dart';
import 'package:harmony_tube/core/errors/failure.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist_usecase.dart';

class PlaylistTracksBloc
    extends Bloc<PlaylistTracksEvent, PlaylistTracksState> {
  final PlaylistUsecase playlistUsecase;

  PlaylistTracksBloc({required this.playlistUsecase})
      : super(const PlaylistTracksState()) {
    on<AddTrackToPlaylist>(_onAddTrack);
    on<AddMultipleTrackToPlaylist>(_onAddMultipleTracks);
    on<RemoveTrackFromPlaylist>(_onRemoveTrack);
    on<RemoveMultipleTrackFromPlaylist>(_onRemoveMultipleTracks);
  }

  Future<void> _onAddTrack(
    AddTrackToPlaylist event,
    Emitter<PlaylistTracksState> emit,
  ) async {
    emit(state.copyWith(error: null, isLoading: true));
    final result = await playlistUsecase.addTrack(
      playlistId: event.playlistId,
      track: event.track,
    );
    emit(_stateFromResult(result));
  }

  Future<void> _onAddMultipleTracks(
    AddMultipleTrackToPlaylist event,
    Emitter<PlaylistTracksState> emit,
  ) async {
    emit(state.copyWith(error: null, isLoading: true));
    PlaylistItemModel? lastUpdated;
    Failure? failure;

    for (final playlistId in event.playlistIds) {
      for (final track in event.tracks) {
        final result = await playlistUsecase.addTrack(
          playlistId: playlistId,
          track: track,
        );
        result.fold(
          onSuccess: (updated) => lastUpdated = updated,
          onFailure: (f) => failure = f,
        );
        if (failure != null) break;
      }
      if (failure != null) break;
    }

    if (failure != null) {
      emit(state.copyWith(error: failure, isLoading: false));
    } else {
      emit(
        state.copyWith(
          lastUpdated: lastUpdated,
          error: null,
          isLoading: false,
        ),
      );
    }
  }

  Future<void> _onRemoveTrack(
    RemoveTrackFromPlaylist event,
    Emitter<PlaylistTracksState> emit,
  ) async {
    emit(state.copyWith(error: null, isLoading: true));
    final result = await playlistUsecase.removeTrack(
      playlistId: event.playlistId,
      trackId: event.trackId,
    );
    emit(_stateFromResult(result));
  }

  Future<void> _onRemoveMultipleTracks(
    RemoveMultipleTrackFromPlaylist event,
    Emitter<PlaylistTracksState> emit,
  ) async {
    emit(state.copyWith(error: null, isLoading: true));
    PlaylistItemModel? lastUpdated;
    Failure? failure;

    for (final trackId in event.trackIds) {
      final result = await playlistUsecase.removeTrack(
        playlistId: event.playlistId,
        trackId: trackId,
      );
      result.fold(
        onSuccess: (updated) => lastUpdated = updated,
        onFailure: (f) => failure = f,
      );
      if (failure != null) break;
    }

    if (failure != null) {
      emit(state.copyWith(error: failure, isLoading: false));
    } else {
      emit(
        state.copyWith(
          lastUpdated: lastUpdated,
          error: null,
          isLoading: false,
        ),
      );
    }
  }

  PlaylistTracksState _stateFromResult(result) {
    return result.fold(
      onSuccess: (updated) => state.copyWith(
        lastUpdated: updated,
        error: null,
        isLoading: false,
      ),
      onFailure: (failure) => state.copyWith(
        error: failure,
        isLoading: false,
      ),
    );
  }
}
