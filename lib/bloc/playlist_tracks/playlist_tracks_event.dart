import 'package:equatable/equatable.dart';
import 'package:harmony_tube/core/models/local_track.dart';

abstract class PlaylistTracksEvent extends Equatable {
  const PlaylistTracksEvent();

  @override
  List<Object?> get props => [];
}

class AddTrackToPlaylist extends PlaylistTracksEvent {
  final String playlistId;
  final TrackItemModel track;

  const AddTrackToPlaylist({required this.playlistId, required this.track});

  @override
  List<Object?> get props => [playlistId, track];
}

class AddMultipleTrackToPlaylist extends PlaylistTracksEvent {
  final List<String> playlistIds;
  final List<TrackItemModel> tracks;

  const AddMultipleTrackToPlaylist({
    required this.playlistIds,
    required this.tracks,
  });

  @override
  List<Object?> get props => [playlistIds, tracks];
}

class RemoveTrackFromPlaylist extends PlaylistTracksEvent {
  final String playlistId;
  final String trackId;

  const RemoveTrackFromPlaylist({
    required this.playlistId,
    required this.trackId,
  });

  @override
  List<Object?> get props => [playlistId, trackId];
}

class RemoveMultipleTrackFromPlaylist extends PlaylistTracksEvent {
  final String playlistId;
  final List<String> trackIds;

  const RemoveMultipleTrackFromPlaylist({
    required this.playlistId,
    required this.trackIds,
  });

  @override
  List<Object?> get props => [playlistId, trackIds];
}
