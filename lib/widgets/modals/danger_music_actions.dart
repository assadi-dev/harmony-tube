import 'package:flutter/material.dart';
import 'package:harmony_tube/services/musique_actions_services.dart';
import 'package:harmony_tube/widgets/text_with_icon_gesture.dart';

class DangerMusicActions {

  final BuildContext context;
  final String id;
  final dynamic extras;

  const DangerMusicActions({ required  this.context, required  this.id,this.extras = null});

  Widget removeTrackAction () {
    return TextWithIconGesture(
      text: "Supprimer",
      icon: Icons.delete_outline,
      onTap: () => MusicModalHandler.delete_music(context, id),
    );
  }

  Widget removeTrackToPlaylistAction () {
    return TextWithIconGesture(
      text: "Retirer de la playlist",
      icon: Icons.delete_outline,
      onTap: () => MusicModalHandler.delete_music(context, id),
    );
  }


}
