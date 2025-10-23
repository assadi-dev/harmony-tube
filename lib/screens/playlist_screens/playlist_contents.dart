import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/config/app_config.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist.dart';
import 'package:harmony_tube/cubit/playlist/playlist_bloc.dart';
import 'package:harmony_tube/cubit/playlist/playlist_event.dart';
import 'package:harmony_tube/cubit/playlist/playlist_state.dart';
import 'package:harmony_tube/screens/playlist_screens/playlist_screen_status.dart';
import 'package:harmony_tube/widgets/cards/playlist_card.dart';

class PlaylistContents extends StatelessWidget {
   PlaylistContents({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<PlaylistBloc, PlaylistState>(
      builder: (BuildContext context, PlaylistState state) {
        return PlaylistScreenStatus(
            isLoading: state.isLoading,
            isError: state.error != null ? true : false,
            child: playlistListItems(state.collections));
      },);

  }
}


Widget playlistListItems(List<PlaylistItemModel> playlists) {
  return ListView.separated(
    separatorBuilder: (context, index) =>
    const SizedBox(height: list_spacing_icon_size,),
    shrinkWrap: true,
    itemCount: playlists.length,
    itemBuilder: (context, index) {
      return PlaylistCard(playlistItem: playlists[index],);
    },
  );
}