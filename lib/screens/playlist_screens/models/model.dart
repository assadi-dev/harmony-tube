
import 'package:harmony_tube/core/models/playlist/local_playlist.dart';

class PlaylistItem {
  final String id;
  final String title;
  final int totalTracks;
   String? imageUrl;

  PlaylistItem(
      {required this.id, required this.title, required this.totalTracks, this.imageUrl});
}



class PlaylistFormValues {
  final String title;
  final String? description;
  final String? imageUrl;

  PlaylistFormValues({required this.title, this.description, this.imageUrl});

  factory PlaylistFormValues.empty() => PlaylistFormValues(title: '', description: '', imageUrl:'');

  factory PlaylistFormValues.fromFormData(dynamic formData) {
final now = DateTime.now();
    return PlaylistFormValues(
      title: formData.title ?? 'playlist_$now',
      description: formData.description ?? '',
    );

  }



  static PlaylistItemModel toPlaylistItemModel(PlaylistFormValues values) {
    return PlaylistItemModel(
      id: '',
      title: values.title,
      description: values.description,
      tracks: [],
      nbTracks: 0
     );

  }



}