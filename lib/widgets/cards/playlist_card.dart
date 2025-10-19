import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:harmony_tube/config/app_config.dart';
import 'package:harmony_tube/routes/models/router_args.dart';
import 'package:harmony_tube/routes/router_path.dart';
import 'package:harmony_tube/screens/playlist_screens/models/model.dart';
import 'package:harmony_tube/services/playlist_actions_handler.dart';
import 'package:harmony_tube/widgets/app_text_theme.dart';
import 'package:harmony_tube/widgets/cards/card.dart';
import 'package:harmony_tube/widgets/previews/preview_playlist_image.dart';
import 'package:harmony_tube/widgets/text_with_icon_gesture.dart';

import 'playlist_modal_action.dart';

class PlaylistCard extends StatelessWidget {
  final PlaylistItem playlistItem;


  PlaylistCard({super.key, required this.playlistItem});


  @override
  Widget build(BuildContext context) {
    print(playlistItem.title);
    void getToDetail() {
      context.pushNamed(RouterPath.playlistDetail.name,
          extra: PlaylistDetailExtra.fromPlaylistItem(playlistItem));
    }

    return AppCard(child: Row(children: [
      GestureDetector(child: PlaylistCardRow(playlistItem), onTap: getToDetail),
      Spacer(),
      MoreButton()
    ]));
  }
}


Widget PlaylistCardPreview(PlaylistItem playlistItem) {
  final String? imageSrc = playlistItem.imageUrl ?? null;
  return  PreviewPlaylistImage(source: imageSrc);
}

Widget playlistCardColumn(PlaylistItem playlistItem) {
  final String title = playlistItem.title;
  final int totalTracks = playlistItem.totalTracks;
  final String totalTracksText = totalTracks == 1
      ? '$totalTracks track'
      : '$totalTracks tracks';
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [AppTextTheme(title), AppTextTheme(totalTracksText,color: Colors.grey.shade500)],
  );
}

Widget PlaylistCardRow(PlaylistItem playlistItem) {
  return Row(
    spacing: 8,
    children: [
      PlaylistCardPreview(playlistItem),
      playlistCardColumn(playlistItem),
    ],
  );
}


void openModalBottomSheet(BuildContext context) async {
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
          margin: EdgeInsets.only(bottom: 50),
          height: MediaQuery
              .of(ctx)
              .size
              .height * 0.45,
          width: MediaQuery
              .of(ctx)
              .size
              .width * 0.95,
          child: PlaylistModalAction(child: Padding(
            padding: EdgeInsets.all(15), child: MoreOptionList(),),),
        ),
  );
}


class MoreButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {
        openModalBottomSheet(context);
      },
      child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Row(crossAxisAlignment: CrossAxisAlignment.end,
              children: [Icon(Icons.more_vert_outlined,size: more_icon_size,)])),
    );
  }
}


class MoreOptionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 15,
      children: [
        TextWithIconGesture(
            text: "Jouer la playlist",
            icon: Icons.play_arrow_outlined,
            onTap: () => PlaylistModalHandler.play_playlist(context, "1")),
        TextWithIconGesture(
            text: "Changer la couverture",
            icon: Icons.image_outlined,
            onTap: () => PlaylistModalHandler.edit_playlist(context, "1")),

        TextWithIconGesture(
            text: "Modifier",
            icon: Icons.edit_outlined,
            onTap: () => PlaylistModalHandler.edit_playlist(context, "1")),
        TextWithIconGesture(text: "Télécharger",
            icon: Icons.download_outlined,
            onTap: () => PlaylistModalHandler.download_playlist(context, "1")),
        TextWithIconGesture(text: "Supprimer",
            icon: Icons.delete_outline,
            onTap: () => PlaylistModalHandler.delete_playlist(context, "1")),

      ],
    );
  }

}
