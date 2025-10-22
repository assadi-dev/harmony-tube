import 'package:flutter/material.dart';
import 'package:harmony_tube/services/musique_actions_services.dart';
import 'package:harmony_tube/widgets/modals/danger_music_actions.dart';
import 'package:harmony_tube/widgets/text_with_icon_gesture.dart';


List<Widget> basicActions(BuildContext context, String musicId) =>
    [ TextWithIconGesture(
      text: "Ajouter aux favoris",
      icon: Icons.favorite_border,
      onTap: () => MusicModalHandler.add_favorite(context, "1"),
    ),
      TextWithIconGesture(
        text: "Ajouter à la playlist",
        icon: Icons.playlist_add_outlined,
        onTap: () => MusicModalHandler.add_to_playlist(context, "1", "1"),
      ),
      TextWithIconGesture(
        text: "Modifier",
        icon: Icons.edit_outlined,
        onTap: () => MusicModalHandler.edit_music(context, "1"),
      ),
      TextWithIconGesture(
        text: "Partager",
        icon: Icons.share_outlined,
        onTap: () => MusicModalHandler.share_music(context, "1"),
      ),
      TextWithIconGesture(
        text: "Télécharger",
        icon: Icons.download_outlined,
        onTap: () => MusicModalHandler.download_music(context, "1"),
      ),
    ];




class MoreActionsList {

  final BuildContext context;
  final String id;
  MoreActionsList( { required this.context, required this.id});

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
