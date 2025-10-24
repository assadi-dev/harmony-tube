import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/bloc/playlist/playlist_bloc.dart';
import 'package:harmony_tube/bloc/playlist/playlist_event.dart';
import 'package:harmony_tube/widgets/modals/confirm_modal.dart';

class PlaylistModalHandler  {

  static info_playlist(BuildContext context, String id) {
    //TODO Implement show info logic
    Navigator.pop(context);
  }

  static play_playlist(BuildContext context, String id) {
    //TODO Implement play music logic
    Navigator.pop(context);
  }

  static edit_playlist(BuildContext context, String id) {
    //TODO Implement edit music logic
    Navigator.pop(context);
  }

  static delete_playlist(BuildContext context, String id) {
    Navigator.of(context).pop();
    void  confirmDelete(BuildContext context)  {
    print("Confirm Deleting Playlist");
    context.read<PlaylistBloc>().add(DeletePlaylist(playlistId: id));


    }


   final confirmModal = ConfirmModal(context: context, message: "Are you sure you want to delete this playlist?", onConfirm: confirmDelete );
    confirmModal.show();
  }

  static download_playlist(BuildContext context, String id) {
    //TODO Implement download music logic
    Navigator.pop(context);
  }

  static add_or_edit_cover(BuildContext context, String id) {
    //TODO Implement download music logic
    Navigator.pop(context);
  }

  static reorder_playlist_tracks(BuildContext context, String id) {
    //TODO Implement reorder music logic
    Navigator.pop(context);
  }
}
