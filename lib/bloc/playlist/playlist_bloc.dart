import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/bloc/playlist/playlist_event.dart';
import 'package:harmony_tube/bloc/playlist/playlist_state.dart';
import 'package:harmony_tube/core/models/local_track.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist_usecase.dart';

class PlaylistBloc extends Bloc<PlaylistEvent, PlaylistState> {
  final PlaylistUsecase playlistUsecase;

  PlaylistBloc({required this.playlistUsecase}) : super(const PlaylistState()) {
    on<GetPlaylistCollections>(getCollections);
    on<CreatePlaylist>(createPlaylist);
    on<DeletePlaylist>(deletePlaylist);
    on<UpdatePlaylist>(updatePlaylist);
    on<FindPlaylist>(findPlaylist);
    on<ClearPlaylist>(clearPlaylist);
    on<AddTrackToPlaylist>(addTrackToPlaylist);
    on<AddMultipleTrackToPlaylist>(addMultipleTrackToPlaylist);
    on<RemoveMultipleTrackToPlaylist>(removeMultipleTrackToPlaylist);
  }

  Future<void> getCollections(
    GetPlaylistCollections event,
    Emitter<PlaylistState> emit,
  ) async {
    emit(state.copyWith(error: null, isLoading: true));
    List<PlaylistItemModel> collections = state.collections;
    Exception? error;
    try {
      //TODO Call Playlist usecase here
    } catch (e) {
      error = Exception(e);
    } finally {
      emit(
        state.copyWith(
          collections: collections,
          error: error,
          isLoading: false,
        ),
      );
    }
  }

  Future<void> findPlaylist(
    FindPlaylist event,
    Emitter<PlaylistState> emit,
  ) async {
    try {
      final playlistId = event.playlistId;
      final playlist = state.collections.firstWhere(
        (item) => item.id == playlistId,
      );
      emit(state.copyWith(playlist: playlist, error: null, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: Exception(e), isLoading: false));
    }
  }

  clearPlaylist(ClearPlaylist event, Emitter<PlaylistState> emit) {
    emit(state.copyWith(playlist: null, error: null, isLoading: false));
  }

  Future<void> createPlaylist(
    CreatePlaylist event,
    Emitter<PlaylistState> emit,
  ) async {
    List<PlaylistItemModel> updatedCollections = [...state.collections];
    Exception? error;

    try {
      final newPlaylist = event.playlist;
      updatedCollections.add(newPlaylist);
    } catch (e) {
      error = Exception(e);
    } finally {
      emit(
        state.copyWith(
          collections: updatedCollections,
          error: error,
          isLoading: false,
        ),
      );
    }
  }

  Future<void> deletePlaylist(
    DeletePlaylist event,
    Emitter<PlaylistState> emit,
  ) async {
    List<PlaylistItemModel> updatedCollections = [...state.collections];
    Exception? error;

    try {
      final playlistId = event.playlistId;
      updatedCollections.removeWhere((item) => item.id == playlistId);
    } catch (e) {
      error = Exception(e);
    } finally {
      emit(
        state.copyWith(
          collections: updatedCollections,
          error: error,
          isLoading: false,
        ),
      );
    }
  }

  Future<void> updatePlaylist(
    UpdatePlaylist event,
    Emitter<PlaylistState> emit,
  ) async {
    PlaylistItemModel playlistPayload = event.playlist;
    List<PlaylistItemModel> updatedCollections = [...state.collections];
    Exception? error;

    try {
      updatedCollections = updatedCollections.map((item) {
        if (item.id == playlistPayload.id) {
          return item.copyWith(
            title: playlistPayload.title,
            description: playlistPayload.description,
            cover: playlistPayload.cover,
            tracks: playlistPayload.tracks,
            nbTracks: playlistPayload.nbTracks,
            lastPlayedAt: playlistPayload.lastPlayedAt,
            updatedAt: DateTime.now(),
          );
        }
        return item;
      }).toList();
    } catch (e) {
      error = Exception(e);
    } finally {
      emit(
        state.copyWith(
          collections: updatedCollections,
          error: error,
          isLoading: false,
        ),
      );
    }
  }

  Future<void> addTrackToPlaylist(
    AddTrackToPlaylist event,
    Emitter<PlaylistState> emit,
  ) async {
    Exception? error;
    final String playlistId = event.playlistId;
    final TrackItemModel track = event.track;
    List<PlaylistItemModel> updatedCollections = [...state.collections];

    try {
      updatedCollections = updatedCollections.map((item) {
        if (item.id == playlistId) {
          final newTracks = [...item.tracks, track];
          return item.copyWith(
            tracks: newTracks,
            nbTracks: newTracks.length,
            updatedAt: DateTime.now(),
          );
        }
        return item;
      }).toList();
    } catch (e) {
      error = Exception(e);
    } finally {
      emit(
        state.copyWith(
          collections: updatedCollections,
          error: error,
          isLoading: false,
        ),
      );
    }
  }

  Future<void> addMultipleTrackToPlaylist(
    AddMultipleTrackToPlaylist event,
    Emitter<PlaylistState> emit,
  ) async {
    Exception? error;
    final List<String> playlistIds = event.playlistIds;
    final List<TrackItemModel> tracks = event.tracks;
    List<PlaylistItemModel> updatedCollections = [...state.collections];

    try {
      updatedCollections = updatedCollections.map((item) {
        if (playlistIds.contains(item.id)) {
          final newTracks = [...item.tracks, ...tracks];
          return item.copyWith(
            tracks: newTracks,
            nbTracks: newTracks.length,
            updatedAt: DateTime.now(),
          );
        }
        return item;
      }).toList();
    } catch (e) {
      error = Exception(e);
    } finally {
      emit(
        state.copyWith(
          collections: updatedCollections,
          error: error,
          isLoading: false,
        ),
      );
    }
  }

  Future<void> removeMultipleTrackToPlaylist(
    RemoveMultipleTrackToPlaylist event,
    Emitter<PlaylistState> emit,
  ) async {
    Exception? error;
    final List<String> trackIds = event.trackIds;
    final String playlistId = event.playlistId;
    List<PlaylistItemModel> updatedCollections = [...state.collections];

    try {
      updatedCollections = updatedCollections.map((item) {
        if (item.id == playlistId) {
          final newTracks =
              item.tracks.where((t) => !trackIds.contains(t.id)).toList();
          return item.copyWith(
            tracks: newTracks,
            nbTracks: newTracks.length,
            updatedAt: DateTime.now(),
          );
        }
        return item;
      }).toList();
    } catch (e) {
      error = Exception(e);
    } finally {
      emit(
        state.copyWith(
          collections: updatedCollections,
          error: error,
          isLoading: false,
        ),
      );
    }
  }
}
