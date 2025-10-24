import 'package:flutter/material.dart';
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

    void  confirmDelete() async {
    print("Confirm Deleting Playlist");
    Navigator.of(context).pop();

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
