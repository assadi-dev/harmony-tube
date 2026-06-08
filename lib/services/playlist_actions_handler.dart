import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/bloc/playlist/playlist_bloc.dart';
import 'package:harmony_tube/bloc/playlist/playlist_event.dart';
import 'package:harmony_tube/screens/playlist_screens/modals/edit_playlist_modal.dart';
import 'package:harmony_tube/widgets/modals/confirm_modal.dart';

class PlaylistModalHandler  {

  static infoPlaylist(BuildContext context, String id) {
    //TODO Implement show info logic
    Navigator.pop(context);
  }

  static playPlaylist(BuildContext context, String id) {
    //TODO Implement play music logic
    Navigator.pop(context);
  }

  static editPlaylist(BuildContext context, String id) {

    Navigator.pop(context);
   context.read<PlaylistBloc>().add(FindPlaylist(playlistId: id));
    final editPlaylistModal = EditPlaylistModal(context: context,);
    editPlaylistModal.open();


  }

  static deletePlaylist(BuildContext context, String id) {
    Navigator.of(context).pop();
    void  confirmDelete(BuildContext context)  {
      context.read<PlaylistBloc>().add(DeletePlaylist(playlistId: id));

    }

   final confirmModal = ConfirmModal(context: context, message: "Are you sure you want to delete this playlist?", onConfirm: confirmDelete );
    confirmModal.open();
  }

  static downloadPlaylist(BuildContext context, String id) {
    //TODO Implement download music logic
    Navigator.pop(context);
  }

  static addOrEditCover(BuildContext context, String id) {
    //TODO Implement download music logic
    Navigator.pop(context);
  }

  static reorderPlaylistTracks(BuildContext context, String id) {
    //TODO Implement reorder music logic
    Navigator.pop(context);
  }
}
