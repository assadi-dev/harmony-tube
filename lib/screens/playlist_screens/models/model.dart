
class PlaylistItem {
  final String id;
  final String title;
  final int totalTracks;
   String? imageUrl;

  PlaylistItem(
      {required this.id, required this.title, required this.totalTracks, this.imageUrl});
}
