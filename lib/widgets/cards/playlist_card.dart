import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:harmony_tube/config/app_config.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist.dart';
import 'package:harmony_tube/routes/models/router_args.dart';
import 'package:harmony_tube/routes/router_path.dart';
import 'package:harmony_tube/screens/playlist_screens/models/model.dart';
import 'package:harmony_tube/services/playlist_actions_handler.dart';
import 'package:harmony_tube/widgets/Buttons/more_button.dart';
import 'package:harmony_tube/widgets/app_text_theme.dart';
import 'package:harmony_tube/widgets/cards/card.dart';
import 'package:harmony_tube/widgets/previews/preview_playlist_image.dart';
import 'package:harmony_tube/widgets/text_with_icon_gesture.dart';

import 'playlist_modal_action.dart';

class PlaylistCard extends StatelessWidget {
  final PlaylistItemModel playlistItem;


  PlaylistCard({super.key, required this.playlistItem});


  @override
  Widget build(BuildContext context) {

    void getToDetail() {
      context.pushNamed(RouterPath.playlistDetail.name,
          extra: PlaylistDetailExtra.fromPlaylistItemModel(playlistItem));
    }

    return AppCard(child: Row(children: [
      GestureDetector(child: PlaylistCardRow(playlistItem), onTap: getToDetail),
      Spacer(),
      MoreButton(playlistId: playlistItem.id, playlistItem: playlistItem)
    ]));
  }
}


Widget PlaylistCardPreview(PlaylistItemModel playlistItem) {
  final String? imageSrc = playlistItem.cover ?? null;
  return  PreviewPlaylistImage(source: imageSrc);
}

Widget playlistCardColumn(PlaylistItemModel playlistItem) {
  final String title = playlistItem.title;
  final int totalTracks = playlistItem.nbTracks;
  final String totalTracksText = totalTracks == 1
      ? '$totalTracks track'
      : '$totalTracks tracks';
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [AppTextTheme(title), AppTextTheme(totalTracksText,color: Colors.grey.shade500)],
  );
}

Widget PlaylistCardRow(PlaylistItemModel playlistItem) {
  return Row(
    spacing: 8,
    children: [
      PlaylistCardPreview(playlistItem),
      playlistCardColumn(playlistItem),
    ],
  );
}


class PlaylistModalBottomSheet {

  final Widget moreOptionWidget;
  final BuildContext context;
  final PlaylistItemModel playlistItem;



  PlaylistModalBottomSheet({ required this.context, required this.moreOptionWidget, required this.playlistItem});

  void openModal() async {
    await showModalBottomSheet(
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (ctx) =>
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),


            width: MediaQuery
                .of(ctx)
                .size
                .width * 0.95,
            child: PlaylistModalAction(
              title: playlistItem.title,
              child: Padding(
                padding: EdgeInsets.all(15), child: moreOptionWidget,),),
          ),
    );
  }

}



class MoreButton extends StatelessWidget {
  final String playlistId;
  final PlaylistItemModel playlistItem;

  const MoreButton({super.key,required this.playlistId,required this.playlistItem});

  @override
  Widget build(BuildContext context) {
    final modalBottomSheet = PlaylistModalBottomSheet(
      context: context,
      moreOptionWidget: PlaylistMoreOptionList(playlistId: playlistId),
      playlistItem: playlistItem,
    );

    return MoreIconButton(onPress: () => modalBottomSheet.openModal());
  }
}


class PlaylistMoreOptionList extends StatelessWidget {
  final String playlistId;

  const PlaylistMoreOptionList({super.key, required this.playlistId});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 15,
      children: [
        TextWithIconGesture(
            text: "Informations",
            icon: Icons.info_outline,
            onTap: () => PlaylistModalHandler.info_playlist(context, playlistId)),
        TextWithIconGesture(
            text: "Jouer la playlist",
            icon: Icons.play_arrow_outlined,
            onTap: () => PlaylistModalHandler.play_playlist(context, playlistId)),
        TextWithIconGesture(
            text: "Changer la couverture",
            icon: Icons.image_outlined,
            onTap: () => PlaylistModalHandler.edit_playlist(context, playlistId)),
        TextWithIconGesture(
            text: "Modifier",
            icon: Icons.edit_outlined,
            onTap: () => PlaylistModalHandler.edit_playlist(context, playlistId)),
        TextWithIconGesture(
            text: "Réorganiser",
            icon: Icons.drag_handle_outlined,
            onTap: () => PlaylistModalHandler.reorder_playlist_tracks(context, playlistId)),
        TextWithIconGesture(text: "Télécharger",
            icon: Icons.download_outlined,
            onTap: () => PlaylistModalHandler.download_playlist(context, playlistId)),
        TextWithIconGesture(text: "Supprimer",
            icon: Icons.delete_outline,
            onTap: () => PlaylistModalHandler.delete_playlist(context, playlistId)),

      ],
    );
  }

}
