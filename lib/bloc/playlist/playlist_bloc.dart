import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/bloc/playlist/playlist_event.dart';
import 'package:harmony_tube/bloc/playlist/playlist_state.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist_usecase.dart';

class PlaylistBloc extends Bloc<PlaylistEvent, PlaylistState> {
  final PlaylistUsecase playlistUsecase;

  PlaylistBloc({required this.playlistUsecase})
      : super(const PlaylistState()) {
    on<GetPlaylistCollections>(_onGetCollections);
    on<CreatePlaylist>(_onCreatePlaylist);
    on<DeletePlaylist>(_onDeletePlaylist);
    on<UpdatePlaylist>(_onUpdatePlaylist);
    on<FindPlaylist>(_onFindPlaylist);
    on<ClearPlaylist>(_onClearPlaylist);
  }

  Future<void> _onGetCollections(
    GetPlaylistCollections event,
    Emitter<PlaylistState> emit,
  ) async {
    emit(state.copyWith(error: null, isLoading: true));
    final result = await playlistUsecase.getPlaylistItems();
    emit(
      result.fold(
        onSuccess: (items) => state.copyWith(
          collections: items,
          error: null,
          isLoading: false,
        ),
        onFailure: (failure) => state.copyWith(
          error: failure,
          isLoading: false,
        ),
      ),
    );
  }

  Future<void> _onFindPlaylist(
    FindPlaylist event,
    Emitter<PlaylistState> emit,
  ) async {
    emit(state.copyWith(error: null, isLoading: true));
    final result = await playlistUsecase.findPlaylist(event.playlistId);
    emit(
      result.fold(
        onSuccess: (playlist) => state.copyWith(
          playlist: playlist,
          error: null,
          isLoading: false,
        ),
        onFailure: (failure) => state.copyWith(
          error: failure,
          isLoading: false,
        ),
      ),
    );
  }

  void _onClearPlaylist(ClearPlaylist event, Emitter<PlaylistState> emit) {
    emit(state.copyWith(playlist: null, error: null, isLoading: false));
  }

  Future<void> _onCreatePlaylist(
    CreatePlaylist event,
    Emitter<PlaylistState> emit,
  ) async {
    emit(state.copyWith(error: null, isLoading: true));
    final saveResult = await playlistUsecase.createPlaylist(event.playlist);
    await saveResult.fold(
      onSuccess: (_) async {
        final updated = [...state.collections, event.playlist];
        emit(
          state.copyWith(
            collections: updated,
            error: null,
            isLoading: false,
          ),
        );
      },
      onFailure: (failure) async {
        emit(state.copyWith(error: failure, isLoading: false));
      },
    );
  }

  Future<void> _onDeletePlaylist(
    DeletePlaylist event,
    Emitter<PlaylistState> emit,
  ) async {
    emit(state.copyWith(error: null, isLoading: true));
    final result = await playlistUsecase.deletePlaylist(event.playlistId);
    emit(
      result.fold(
        onSuccess: (_) {
          final updated = state.collections
              .where((p) => p.id != event.playlistId)
              .toList(growable: false);
          return state.copyWith(
            collections: updated,
            error: null,
            isLoading: false,
          );
        },
        onFailure: (failure) =>
            state.copyWith(error: failure, isLoading: false),
      ),
    );
  }

  Future<void> _onUpdatePlaylist(
    UpdatePlaylist event,
    Emitter<PlaylistState> emit,
  ) async {
    emit(state.copyWith(error: null, isLoading: true));
    final result = await playlistUsecase.updatePlaylist(event.playlist);
    emit(
      result.fold(
        onSuccess: (updated) {
          final collections = state.collections
              .map((p) => p.id == updated.id ? updated : p)
              .toList(growable: false);
          return state.copyWith(
            collections: collections,
            playlist: updated,
            error: null,
            isLoading: false,
          );
        },
        onFailure: (failure) =>
            state.copyWith(error: failure, isLoading: false),
      ),
    );
  }

}
