import 'package:flutter/material.dart' hide Card;
import 'package:harmony_tube/config/app_config.dart';
import 'package:harmony_tube/core/models/local_track.dart';
import 'package:harmony_tube/core/utils/files_system.dart';
import 'package:harmony_tube/widgets/Buttons/more_button.dart';
import 'package:harmony_tube/widgets/app_text_theme.dart';
import 'package:harmony_tube/widgets/cards/card.dart';
import 'package:harmony_tube/widgets/cards/music_modal_action.dart';


/*class MusicCardListOptions {

  final Widget moreOptionWidget;

  MusicCardListOptions({required this.moreOptionWidget});

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
              padding: EdgeInsets.all(15), child: moreOptionWidget,),),
          ),
    );
  }

}
*/

class MusicCard extends StatelessWidget {
  final Widget moreOptionWidget;
  final TrackItemModel trackItem;

  const MusicCard({super.key,required this.moreOptionWidget, required this.trackItem});

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
            MoreButton(moreOptionWidget: moreOptionWidget,trackItem: trackItem)
          ],
        ),
      ),
    );
  }
}



class MoreButton extends StatelessWidget {
  final TrackItemModel trackItem;
  final Widget moreOptionWidget;

  const MoreButton({super.key, required this.moreOptionWidget, required this.trackItem});

  @override
  Widget build(BuildContext context) {

    final modalBottomSheet = OpenModalBottomSheet(context: context, moreOptionWidget: moreOptionWidget,trackItem:trackItem );

    return MoreIconButton(
      onPress: () {
        modalBottomSheet.openModal();
      },

    );
  }
}

class OpenModalBottomSheet {

  final Widget moreOptionWidget;
  final BuildContext context;
  final TrackItemModel trackItem;


  OpenModalBottomSheet(
      { required this.context, required this.moreOptionWidget,required this.trackItem});

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

            height: MediaQuery
                .of(ctx)
                .size
                .height,
            width: MediaQuery
                .of(ctx)
                .size
                .width * 0.95,
            child: MusicModalAction(
              title: trackItem.title,

              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: moreOptionWidget,),),
          ),
    );
  }

}

class MediaPreview extends StatelessWidget {
  
  final String? imageSrc;
  MediaPreview({this.imageSrc});



  Image _previewImage() {
    if (imageSrc != null) {
      if (isHttpUrl(imageSrc!)) {
        return Image.network(imageSrc!, fit: BoxFit.cover);
      }
      //TODO Load image from local storage
      return Image.asset(imageSrc!, fit: BoxFit.cover);
    }
    return Image.asset(no_cover_image, fit: BoxFit.cover);
  }
  
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
        child:  _previewImage(),
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
