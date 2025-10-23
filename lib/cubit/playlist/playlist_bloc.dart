import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist.dart';
import 'package:harmony_tube/cubit/playlist/playlist_event.dart';
import 'package:harmony_tube/cubit/playlist/playlist_state.dart';

class PlaylistBloc extends Bloc<PlaylistEvent, PlaylistState> {
  PlaylistBloc() : super(const PlaylistState()) {
    on<GetPlaylistCollections>(getCollections);
    on<CreatePlaylist>(createPlaylist);
    on<DeletePlaylist>(deletePlaylist);
    on<UpdatePlaylist>(updatePlaylist);
  }

  Future<void> getCollections(
    GetPlaylistCollections event,
    Emitter<PlaylistState> emit,
  ) async {
    emit(state.copyWith(error: null, isLoading: true));
    List<PlaylistItemModel> collections = state.collections ?? [];
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

  Future<void> createPlaylist(
    CreatePlaylist event,
    Emitter<PlaylistState> emit,
  ) async {
    List<PlaylistItemModel> updatedCollections = [...state.collections ?? []];
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
    List<PlaylistItemModel> updatedCollections = [...state.collections ?? []];
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
    List<PlaylistItemModel> updatedCollections = [...state.collections ?? []];
    Exception? error;

    try {
      updatedCollections = updatedCollections.map((item) {
        if (item.id == playlistPayload.id) {
          return item.copyWith(playlistPayload);
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
