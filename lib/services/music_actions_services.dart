
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/bloc/playlist/playlist_bloc.dart';
import 'package:harmony_tube/bloc/playlist_tracks/playlist_tracks_bloc.dart';
import 'package:harmony_tube/bloc/playlist_tracks/playlist_tracks_event.dart';
import 'package:harmony_tube/cubit/selected_items.dart';
import 'package:harmony_tube/widgets/modals/confirm_modal.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class MusicModalHandler {

  final BuildContext context;
  final String  id;
  MusicModalHandler({required this.context, required this.id});

 void  add_favorite() {
    //TODO Implement add favorite logic
    Navigator.of(context).pop();
  }

  void  add_to_playlist() {
    WoltModalSheet.of(context).showPageWithId("playlist_select");
  }

 void  edit_music() {
    //TODO Implement edit music logic
    Navigator.pop(context);
  }

 void  share_music() {
    //TODO Implement share music logic
    Navigator.pop(context);
  }

 void  delete_music() {
    //TODO Implement delete music logic
    Navigator.pop(context);
 }

  void delete_music_from_playlist() {



    void confirmDelete(BuildContext context) {
      final currentPlaylist =
          BlocProvider.of<PlaylistBloc>(context).state.playlist;
      if (currentPlaylist == null) {
        Navigator.pop(context);
        return;
      }
      BlocProvider.of<PlaylistTracksBloc>(context).add(
        RemoveMultipleTrackFromPlaylist(
          trackIds: [id],
          playlistId: currentPlaylist.id,
        ),
      );
      BlocProvider.of<SelectedItemsCubit>(context).clearAll();
      Navigator.pop(context);
    }

    final confirmModal = ConfirmModal(context: context,
        message: "Are you sure to want to remove this music from this playlist?",
        top: Text("Remove this music from this playlist?",
            style: TextStyle(color: Colors.grey)),
        onConfirm: confirmDelete);
    confirmModal.open();
  }

void  download_music() {
    //TODO Implement download music logic
    Navigator.pop(context);
  }
}