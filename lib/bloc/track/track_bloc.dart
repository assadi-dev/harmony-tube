import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/bloc/track/track_event.dart';
import 'package:harmony_tube/bloc/track/track_state.dart';
import 'package:harmony_tube/core/models/local_track.dart';
import 'package:harmony_tube/mocks/songs.dart';


class TrackBloc extends Bloc<TrackEvent, TrackState> {
  TrackBloc() : super(const TrackState()) {
    on<GetAllTrackCollections>(retrieveAllTrackCollections);
    on<AddTrack>(addTrack);
    on<DeleteTrack>(removeTrack);
  }


  Future<void> retrieveAllTrackCollections(TrackEvent event,
      Emitter<TrackState> emit) async {
     List<TrackItemModel> collections = state.collections ?? [];
    Exception? error;
    try {
      emit(state.copyWith(error: null, isLoading: true));
      //TODO Call API to retrieve all track collections
      collections = youtubeTrackMock;

    }
    catch (e) {
      error = Exception(e);
    } finally {
      emit(state.copyWith(
          isLoading: false, collections: collections, error: error));
    }
  }


  void addTrack(AddTrack event, Emitter<TrackState> emit) {
    final List<TrackItemModel> updatedCollections = [
      ...state.collections ?? []
    ];
    Exception? error;
    try {
      final newTrack = event.track;
      updatedCollections.add(newTrack);
    } catch (e) {
      error = Exception(e);
    } finally {
      emit(state.copyWith(
          collections: updatedCollections, error: error, isLoading: false));
    }
  }

  void removeTrack(DeleteTrack event, Emitter<TrackState> emit) {

    final List<TrackItemModel> updatedCollections = [
      ...state.collections ?? []
    ];
    Exception? error;
    try {
     final String trackId = event.trackId;
      updatedCollections.removeWhere((track) => track.id == trackId);
    } catch (e) {
      error = Exception(e);
    } finally {
      emit(state.copyWith(
          collections: updatedCollections, error: error, isLoading: false));
    }

  }
}