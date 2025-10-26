import 'package:equatable/equatable.dart';
import 'package:harmony_tube/core/models/local_track.dart';

class TrackState extends Equatable {

  final List<TrackItemModel> collections;
  final TrackItemModel? track;
  final Exception? error;
  final bool isLoading;

  const TrackState({
    this.collections = const [],
    this.track,
    this.error,
    this.isLoading = true,});

  TrackState copyWith({
    List<TrackItemModel>? collections,
    TrackItemModel? track,
    Exception? error,
    bool? isLoading,}){
    return TrackState(
      collections: collections ?? this.collections,
      track: track ?? this.track,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );

  }

  @override
  List<Object?> get props => [collections, track, error, isLoading];
}