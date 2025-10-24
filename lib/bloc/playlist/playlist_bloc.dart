import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/bloc/playlist/playlist_event.dart';
import 'package:harmony_tube/bloc/playlist/playlist_state.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist.dart';


class PlaylistBloc extends Bloc<PlaylistEvent, PlaylistState> {
  PlaylistBloc() : super(const PlaylistState()) {
    on<GetPlaylistCollections>(getCollections);
    on<CreatePlaylist>(createPlaylist);
    on<DeletePlaylist>(deletePlaylist);
    on<UpdatePlaylist>(updatePlaylist);
    on<FindPlaylist>(findPlaylist);
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

  Future<void> findPlaylist(FindPlaylist event,
      Emitter<PlaylistState> emit,) async {
    try {
      final playlistId = event.playlistId;
      final playlist = state.collections.firstWhere((item) =>
      item.id == playlistId);
      emit(
        state.copyWith(
          playlist: playlist,
          error: null,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          error: Exception(e),
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
