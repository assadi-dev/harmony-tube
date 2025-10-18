import 'package:flutter/material.dart' hide Card;
import 'package:harmony_tube/config/app_config.dart';
import 'package:harmony_tube/services/musique_actions_services.dart';
import 'package:harmony_tube/widgets/app_text_theme.dart';
import 'package:harmony_tube/widgets/cards/card.dart';
import 'package:harmony_tube/widgets/cards/music_modal_action.dart';
import 'package:harmony_tube/widgets/text_with_icon_gesture.dart';

class MusicCard extends StatelessWidget {
  const MusicCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Row(spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [MediaPreview(), MediaInfos()],),
            MoreButton()
          ],
        ),
      ),
    );
  }
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
              .height * 0.55,
          width: MediaQuery
              .of(ctx)
              .size
              .width * 0.95,
          child: MusicModalAction(child: Padding(
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
        child: Icon(Icons.more_vert, size: more_icon_size,),),
    );
  }
}

class MediaPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: preview_picture_small,
      height: preview_picture_small,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(border_radius_card),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(border_radius_card),
        child: Image.asset(no_cover_image,  fit: BoxFit.cover,),
      ),
    );
  }
}

class MediaInfos extends StatefulWidget {

  late final String? title;
  late final String? artist;

  MediaInfos({this.title, this.artist});

  //TODO implement Duration format
  //late final String? duration;

  @override
  State<StatefulWidget> createState() => MediaInfosState(title, artist);

}

class MediaInfosState extends State<MediaInfos> {
  final String? title;
  final String? artist;
  MediaInfosState(this.title, this.artist);

  late final String media_title;
  late final String media_artist;

  @override
  void initState() {
    media_title = title ?? "Music sans titre";
    media_artist = artist ?? "Artist inconnu";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppTextTheme(media_title),
        AppTextTheme(media_artist, color: Colors.grey.shade500),
      ],
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
            text: "Ajouter aux favoris",
            icon: Icons.favorite_border,
            onTap: () => MusicModalHandler.add_favorite(context, "1")),
        TextWithIconGesture(
            text: "Ajouter à la playlist",
            icon: Icons.playlist_add_outlined,
            onTap: () => MusicModalHandler.add_to_playlist(context, "1", "1")),
        TextWithIconGesture(text: "Modifier",
            icon: Icons.edit_outlined,
            onTap: () => MusicModalHandler.edit_music(context, "1")),
        TextWithIconGesture(text: "Partager",
            icon: Icons.share_outlined,
            onTap: () => MusicModalHandler.share_music(context, "1")),
        TextWithIconGesture(text: "Télécharger",
            icon: Icons.download_outlined,
            onTap: () => MusicModalHandler.download_music(context, "1")),
        TextWithIconGesture(text: "Supprimer",
            icon: Icons.delete_outline,
            onTap: () => MusicModalHandler.delete_music(context, "1")),

      ],
    );
  }

}


