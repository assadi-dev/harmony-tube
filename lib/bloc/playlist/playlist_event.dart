import 'package:equatable/equatable.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist.dart';

abstract class PlaylistEvent extends Equatable {
  const PlaylistEvent();

  @override
  List<Object?> get props => [];
}

class GetPlaylistCollections extends PlaylistEvent {
  const GetPlaylistCollections();
}

class CreatePlaylist extends PlaylistEvent {
  final PlaylistItemModel playlist;
  const CreatePlaylist(this.playlist);

  @override
  List<Object?> get props => [playlist];
}

class FindPlaylist extends PlaylistEvent {
  final String playlistId;
  const FindPlaylist({required this.playlistId});

  @override
  List<Object?> get props => [playlistId];
}

class UpdatePlaylist extends PlaylistEvent {
  final PlaylistItemModel playlist;
  const UpdatePlaylist({required this.playlist});

  @override
  List<Object?> get props => [playlist];
}

class ClearPlaylist extends PlaylistEvent {
  const ClearPlaylist();
}

class DeletePlaylist extends PlaylistEvent {
  final String playlistId;
  const DeletePlaylist({required this.playlistId});

  @override
  List<Object?> get props => [playlistId];
}
