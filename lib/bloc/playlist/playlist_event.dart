
import 'package:equatable/equatable.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist.dart';
import 'package:harmony_tube/core/models/local_track.dart';

abstract class PlaylistEvent extends Equatable {

  final PlaylistItemModel? playlist;

  const PlaylistEvent({this.playlist});

  @override
  List<Object> get props => [playlist!];

}


class GetPlaylistCollections extends PlaylistEvent {
  const GetPlaylistCollections();
}


class CreatePlaylist extends PlaylistEvent {
  final PlaylistItemModel playlist;
  const CreatePlaylist(this.playlist);
}


class FindPlaylist extends PlaylistEvent {
  final String playlistId;
  const FindPlaylist({required this.playlistId});
}

class UpdatePlaylist extends PlaylistEvent {
  final PlaylistItemModel playlist;
  const UpdatePlaylist({required this.playlist});
}

class ClearPlaylist extends PlaylistEvent {}




class DeletePlaylist extends PlaylistEvent {
  final String playlistId;
  const DeletePlaylist({required this.playlistId});
}


class ClearTrackToPlaylist extends PlaylistEvent {
  final String playlistId;
  const ClearTrackToPlaylist({required this.playlistId});
}

class GetPlaylistTracks extends PlaylistEvent {
  final String playlistId;
  const GetPlaylistTracks({required this.playlistId});
}

class AddTrackToPlaylist extends PlaylistEvent {
  final TrackItemModel track;
  final String playlistId;
  const AddTrackToPlaylist({required this.playlistId, required this.track});
}

class RemoveTrackToPlaylist extends PlaylistEvent {
  final String trackId;
  final String playlistId;
  const RemoveTrackToPlaylist({required this.playlistId, required this.trackId});
}









