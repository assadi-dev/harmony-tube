import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/bloc/track/track_event.dart';
import 'package:harmony_tube/bloc/track/track_state.dart';
import 'package:harmony_tube/core/models/track_usecase.dart';

class TrackBloc extends Bloc<TrackEvent, TrackState> {
  final TrackUsecase trackUsecase;

  TrackBloc({required this.trackUsecase}) : super(const TrackState()) {
    on<GetAllTrackCollections>(_onGetAll);
    on<AddTrack>(_onAddTrack);
    on<DeleteTrack>(_onDeleteTrack);
  }

  Future<void> _onGetAll(
    GetAllTrackCollections event,
    Emitter<TrackState> emit,
  ) async {
    emit(state.copyWith(error: null, isLoading: true));
    final result = await trackUsecase.getAllTracks();
    emit(
      result.fold(
        onSuccess: (tracks) => state.copyWith(
          collections: tracks,
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

  Future<void> _onAddTrack(AddTrack event, Emitter<TrackState> emit) async {
    emit(state.copyWith(error: null, isLoading: true));
    final result = await trackUsecase.addTrack(event.track);
    emit(
      result.fold(
        onSuccess: (_) => state.copyWith(
          collections: [...state.collections, event.track],
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

  Future<void> _onDeleteTrack(
    DeleteTrack event,
    Emitter<TrackState> emit,
  ) async {
    emit(state.copyWith(error: null, isLoading: true));
    final result = await trackUsecase.removeTrack(event.trackId);
    emit(
      result.fold(
        onSuccess: (_) => state.copyWith(
          collections: state.collections
              .where((t) => t.id != event.trackId)
              .toList(growable: false),
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
}
