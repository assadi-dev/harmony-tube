import 'package:flutter/material.dart';
import 'package:harmony_tube/config/app_config.dart';
import 'package:harmony_tube/screens/playlist_screens/mocks/playlist_mocks.dart';
import 'package:harmony_tube/widgets/cards/playlist_card.dart';

class PlaylistContents extends StatelessWidget {
   PlaylistContents({super.key});

  final playlists = playlistMockData();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,

      padding: const EdgeInsets.all(15),
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: list_spacing_icon_size,),
        shrinkWrap: true,
        itemCount: playlists.length,
        itemBuilder: (context, index) {
          return  PlaylistCard(playlistItem: playlists[index],);
        },
      ),
    );
  }
}
