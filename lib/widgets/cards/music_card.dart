import 'package:flutter/material.dart' hide Card;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/config/app_config.dart';
import 'package:harmony_tube/core/models/local_track.dart';
import 'package:harmony_tube/core/utils/files_system.dart';
import 'package:harmony_tube/core/utils/format_duration.dart';
import 'package:harmony_tube/core/utils/interraction.dart';
import 'package:harmony_tube/cubit/select_mode_cubit.dart';
import 'package:harmony_tube/cubit/selected_items.dart';
import 'package:harmony_tube/widgets/Buttons/more_button.dart';
import 'package:harmony_tube/widgets/cards/music_header_bottom_sheet.dart';
import 'package:harmony_tube/widgets/modals/more_actions_list.dart';
import 'package:harmony_tube/widgets/text_scroll.dart';
import 'package:harmony_tube/widgets/woltPages/PlaylistSelect.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';


const double trackCardFontSize = 12.0;



class MusicCard extends StatelessWidget {
  final MoreActionsList moreOptionInstance;
  final TrackItemModel trackItem;
  void Function(TrackItemModel)? onLongPress;
  void Function(TrackItemModel)? onPress;

  MusicCard(
      {super.key, required this.moreOptionInstance, required this.trackItem, this.onLongPress,this.onPress});

  void handlePress(){
    try {

      if (onLongPress != null) {
        onPress!(trackItem);
      }
    } catch (err) {
      print(err);
    }
  }

  void handleLongPress() {
    try {
      vibrate();
      if (onLongPress != null) {
        onLongPress!(trackItem);
      }
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {

     var selectionModeState = context.watch<SelectModeStateCubit>().state;

    Widget TrailingWidget(){
  selectionModeState.isActive;
      if(selectionModeState.isActive){
        return BlocBuilder<SelectedItemsCubit, SelectedItemsState>(

          builder: (context, state) {
            var selectedItems = state.fromItems;
            var  icon_selected = Icons.radio_button_off_outlined;
            if (selectedItems.contains(trackItem.id)) {
              icon_selected = Icons.radio_button_on_outlined;
            }

            return Icon(icon_selected,  size: 18,);
          });

      }

      return MoreButton(
          moreOptionInstance: moreOptionInstance, trackItem: trackItem);
    }

    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(border_radius_card),
            ),

        leading: MediaPreview(),
        title: MediaInfos(track: trackItem),
        trailing: TrailingWidget(),
        onLongPress: handleLongPress,
        onTap: handlePress,
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
        BlocProvider.of<SelectedItemsCubit>(context).addItemToFrom(trackItem.id);
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
    WoltModalSheet.show(
      context: context,
      showDragHandle: false,
      modalTypeBuilder: (context) => WoltModalType.bottomSheet(),
        pageListBuilder: (ctx) {
          moreOptionInstance.setContext(ctx);
          Widget moreOptionWidget = moreOptionInstance.musicCardActions();
          return [
            moreActionList(ctx, trackItem,moreOptionWidget),
            PlaylistSelect(ctx,trackItem)

          ];
        }
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


SliverWoltModalSheetPage moreActionList(BuildContext modalSheetContext, TrackItemModel trackItem, Widget moreOptionWidget){

  return SliverWoltModalSheetPage(
    hasTopBarLayer: true,
    topBar:MusicHeaderBottomSheet(
      title: trackItem.title,
      description:trackItem.artist ,
    ),
    isTopBarLayerAlwaysVisible: true,
    mainContentSliversBuilder: (context) {

      List<SliverToBoxAdapter> childrens = [  SliverToBoxAdapter(
        child:Padding(padding: EdgeInsetsGeometry.all(15),child:  moreOptionWidget),
      )];

      return  childrens;
    });


}
