import 'package:flutter/material.dart' hide Card;
import 'package:harmony_tube/config/app_config.dart';
import 'package:harmony_tube/core/models/local_track.dart';
import 'package:harmony_tube/core/utils/files_system.dart';
import 'package:harmony_tube/core/utils/format_duration.dart';
import 'package:harmony_tube/widgets/Buttons/more_button.dart';
import 'package:harmony_tube/widgets/cards/card.dart';
import 'package:harmony_tube/widgets/cards/music_modal_action.dart';
import 'package:harmony_tube/widgets/modals/more_actions_list.dart';
import 'package:harmony_tube/widgets/text_scroll.dart';


const double trackCardFontSize = 12.0;



class MusicCard extends StatelessWidget {
  final MoreActionsList moreOptionInstance;
  final TrackItemModel trackItem;

  const MusicCard(
      {super.key, required this.moreOptionInstance, required this.trackItem});

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
              children: [MediaPreview(), MediaInfos(track: trackItem)],),
            MoreButton(
                moreOptionInstance: moreOptionInstance, trackItem: trackItem)
          ],
        ),
      ),
    );
  }
}



class MoreButton extends StatelessWidget {
  final TrackItemModel trackItem;
  final MoreActionsList moreOptionInstance;

  const MoreButton(
      {super.key, required this.moreOptionInstance, required this.trackItem});

  @override
  Widget build(BuildContext context) {
    final modalBottomSheet = OpenModalBottomSheet(context: context,
        moreOptionInstance: moreOptionInstance,
        trackItem: trackItem);

    return MoreIconButton(
      onPress: () {
        modalBottomSheet.openModal();
      },

    );
  }
}

class OpenModalBottomSheet {

  final MoreActionsList moreOptionInstance;
  final BuildContext context;
  final TrackItemModel trackItem;


  OpenModalBottomSheet(
      { required this.context, required this.moreOptionInstance, required this.trackItem});

  void openModal() async {
    await showModalBottomSheet(
        useRootNavigator: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {
          moreOptionInstance.setContext(ctx);
          Widget moreOptionWidget = moreOptionInstance.musicCardActions();
          return Container(
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
              trackItem: trackItem,

              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: moreOptionWidget,),),
          );
        });
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

  final TrackItemModel track;

  MediaInfos({required this.track});
  @override
  State<StatefulWidget> createState() => MediaInfosState();

}

class MediaInfosState extends State<MediaInfos> {
  late String title;
  late String artist;
  late int duration;




  @override
  void initState() {
    title = widget.track.title ?? "Music sans titre";
    artist = widget.track.artist ?? "Artist inconnu";
    duration = widget.track.duration;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.56,
      child: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextHorizontalScroll(text: title, style: TextStyle(color: Theme
              .of(context)
              .primaryColor, fontSize: trackCardFontSize),),
          RowArtistAndDuration(artist, duration)

        ],
      ),
    );
  }
}


Widget RowArtistAndDuration(String artist, int duration) {
  final String formatDuration = formatDurationFromMilliseconds(duration);
  final Color color = Colors.grey.shade500;
  final textStyle = TextStyle(color: color, fontSize: trackCardFontSize);
  return Row(spacing: 8,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Row(
          spacing: 2,
          children: [

            Icon(
                Icons.person_2_outlined, color: color, size: trackCardFontSize),
            TextHorizontalScroll(text: artist, style: textStyle),
          ]),

      Row(spacing: 2, children: [
        Icon(Icons.access_time_rounded, color: color, size: trackCardFontSize),
        Text(formatDuration, style: textStyle)
      ]),

    ],);
}