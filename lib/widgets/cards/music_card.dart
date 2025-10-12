import 'package:flutter/material.dart' hide Card;
import 'package:harmony_tube/config/app_config.dart';
import 'package:harmony_tube/widgets/text_with_icon_gesture.dart';
import 'package:harmony_tube/widgets/app_text_theme.dart';
import 'package:harmony_tube/widgets/cards/card.dart';
import 'package:harmony_tube/widgets/cards/music_modal_action.dart';

class MusicCard extends StatelessWidget {
  const MusicCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8,
          children: [MediaPreview(), MediaInfos(), MoreButton()],
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
    return InkWell(
      onTap: () {
        openModalBottomSheet(context);
      },
      child: Icon(Icons.more_vert),
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

class MediaInfos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppTextTheme("Music sans titre"),
        AppTextTheme("Artist inconnu", color: Colors.grey.shade500),
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
            text: "Ajouter aux favoris", icon: Icons.favorite_border),
        TextWithIconGesture(
            text: "Ajouter à la playlist", icon: Icons.playlist_add_outlined),
        TextWithIconGesture(text: "Modifier", icon: Icons.edit_outlined),
        TextWithIconGesture(text: "Partager", icon: Icons.share_outlined),
        TextWithIconGesture(text: "Télécharger", icon: Icons.download_outlined),
        TextWithIconGesture(text: "Supprimer", icon: Icons.delete_outline),

      ],
    );
  }

}


