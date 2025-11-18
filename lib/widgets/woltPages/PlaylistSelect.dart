import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/bloc/playlist/playlist_bloc.dart';
import 'package:harmony_tube/bloc/playlist/playlist_event.dart';
import 'package:harmony_tube/core/models/local_track.dart';
import 'package:harmony_tube/cubit/selected_items.dart';
import 'package:harmony_tube/widgets/app_text_theme.dart';
import 'package:harmony_tube/widgets/cards/playlist_select_radio.dart';
import 'package:harmony_tube/widgets/woltPages/GoBackModal.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

SliverWoltModalSheetPage PlaylistSelect(BuildContext context,   TrackItemModel trackItem) {


  var playlists = BlocProvider.of<PlaylistBloc>(context).state.collections ?? [];
  var playlistCount = playlists.length ?? 0;





  return SliverWoltModalSheetPage(
    id: 'playlist_select',
    topBarTitle: AppTextTheme('Ajouter à la playlist'),
    leadingNavBarWidget: GoBack(context),
    isTopBarLayerAlwaysVisible: true,
    mainContentSliversBuilder: (BuildContext context) {
      return [

        SliverList(
          delegate: SliverChildBuilderDelegate(
                (_, index) => PlaylistSelectRadio(playlist: playlists[index],
                ),
            childCount: playlistCount,
          ),

        ),
        SliverToBoxAdapter(child: SizedBox(height: 100,),),
      ];
    },

    stickyActionBar: Container(
      color: Colors.transparent,
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: ConfirmButton(trackItem: trackItem),
    ),
  );
}




class ConfirmButton extends StatelessWidget{
final TrackItemModel trackItem;
  const ConfirmButton({super.key, required this.trackItem});

  @override
  Widget build(BuildContext context) {
    void confirm(){
      try{
        final selectedItems = BlocProvider.of<SelectedItemsCubit>(context).state.toItems;
        if(selectedItems.isNotEmpty) {
          BlocProvider.of<PlaylistBloc>(context).add(AddMultipleTrackToPlaylist(tracks: [trackItem], playlistIds: selectedItems));
          print('track added to playlist succefully');
          BlocProvider.of<SelectedItemsCubit>(context).clearAll();
        }

      }catch(e){
        print("error in confirm button: ${e}");
      }

      Navigator.pop(context);
    }

    return BlocBuilder<SelectedItemsCubit, SelectedItemsState>(
      builder: (context, state) {
        return ElevatedButton(onPressed: state.toItems.length > 0 ? confirm : null,  child: Text('Confirmer'));
      });
  }


}

