import 'package:flutter/material.dart';
import 'package:harmony_tube/services/music_actions_services.dart';
import 'package:harmony_tube/widgets/text_with_icon_gesture.dart';

class DangerMusicActions {

  final BuildContext context;
  final String id;
  final dynamic extras;
 late MusicModalHandler trackHandler;
   DangerMusicActions({ required  this.context, required  this.id,this.extras = null}){
    trackHandler = MusicModalHandler(context: context, id: id,);
  }





  Widget removeTrackAction () {

    return TextWithIconGesture(
      text: "Supprimer",
      icon: Icons.delete_outline,
      onTap: () => trackHandler.delete_music(),
    );
  }

  Widget removeTrackToPlaylistAction () {
    return TextWithIconGesture(
      text: "Retirer de la playlist",
      icon: Icons.delete_outline,
      onTap: () => trackHandler.delete_music(),
    );
  }


}
