import 'package:flutter/material.dart';
import 'package:harmony_tube/core/models/local_track.dart';
import 'package:harmony_tube/services/music_actions_services.dart';
import 'package:harmony_tube/widgets/modals/danger_music_actions.dart';
import 'package:harmony_tube/widgets/text_with_icon_gesture.dart';


/**
 * String id : id de la musique
 */
List<Widget> basicActions(BuildContext context, String id) {
  final trackHandler = MusicModalHandler(context: context, id: id);

  return [
    TextWithIconGesture(
      text: "Ajouter aux favoris",
      icon: Icons.favorite_border,
      onTap: () => trackHandler.add_favorite(),
    ),
    TextWithIconGesture(
      text: "Ajouter à la playlist",
      icon: Icons.playlist_add_outlined,
      onTap: () => trackHandler.add_to_playlist(),
    ),
    TextWithIconGesture(
      text: "Modifier",
      icon: Icons.edit_outlined,
      onTap: () => trackHandler.edit_music(),
    ),
    TextWithIconGesture(
      text: "Partager",
      icon: Icons.share_outlined,
      onTap: () => trackHandler.share_music(),
    ),
    TextWithIconGesture(
      text: "Télécharger",
      icon: Icons.download_outlined,
      onTap: () => trackHandler.download_music(),
    ),
  ];
}

class MoreActionsList {

  final BuildContext context;
  final String id;
  final TrackItemModel trackItem;
  MoreActionsList( { required this.context, required this.id, required this.trackItem});

  void setContext (BuildContext context) {
    context = context;
  }


  Widget musicCardActions() {

    final dangerAction = DangerMusicActions(context:context,id: id);

    List<Widget> children = basicActions(context,id);
    children.add(dangerAction.removeTrackAction());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 15,
      children: children,
    );
  }

  Widget musicPlaylistActions() {

    final dangerAction = DangerMusicActions(context:context,id: id);

    List<Widget> children = basicActions(context,id);
    children.add(dangerAction.removeTrackAction());
    children.add(dangerAction.removeTrackToPlaylistAction());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 15,
      children: children,
    );
  }



}
