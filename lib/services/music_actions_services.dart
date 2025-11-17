
import 'package:flutter/material.dart';
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
    //TODO Implement add playlist logic
   // Navigator.pop(context);
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

void  download_music() {
    //TODO Implement download music logic
    Navigator.pop(context);
  }
}