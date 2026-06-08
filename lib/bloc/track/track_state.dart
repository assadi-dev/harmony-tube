import 'package:equatable/equatable.dart';
import 'package:harmony_tube/core/errors/failure.dart';
import 'package:harmony_tube/core/models/local_track.dart';

class TrackState extends Equatable {
  final List<TrackItemModel> collections;
  final TrackItemModel? track;
  final Failure? error;
  final bool isLoading;

  const TrackState({
    this.collections = const [],
    this.track,
    this.error,
    this.isLoading = false,
  });

  TrackState copyWith({
    List<TrackItemModel>? collections,
    Object? track = _sentinel,
    Object? error = _sentinel,
    bool? isLoading,
  }) {
    return TrackState(
      collections: collections ?? this.collections,
      track: identical(track, _sentinel)
          ? this.track
          : track as TrackItemModel?,
      error: identical(error, _sentinel) ? this.error : error as Failure?,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [collections, track, error, isLoading];
}

const Object _sentinel = Object();
