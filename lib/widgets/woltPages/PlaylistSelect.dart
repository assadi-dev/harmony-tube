import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/bloc/playlist/playlist_bloc.dart';
import 'package:harmony_tube/widgets/app_text_theme.dart';
import 'package:harmony_tube/widgets/woltPages/GoBackModal.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

SliverWoltModalSheetPage PlaylistSelect(BuildContext context) {


  var state = BlocProvider.of<PlaylistBloc>(context).state;
  var playlists = state.collections ?? [];

  void confirm() async {
    Navigator.pop(context);
  }


  return SliverWoltModalSheetPage(
    id: 'playlist_select',
    topBarTitle: AppTextTheme('Ajouter à la playlist'),
    leadingNavBarWidget: GoBack(context),

    isTopBarLayerAlwaysVisible: true,
    mainContentSliversBuilder: (BuildContext context) {
      return [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, index) => ListTile(title: Text('Playlist ${playlists[index].title}')),
            childCount: playlists.length,
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 100,),),
      ];
    },

    stickyActionBar: Container(
      color: Colors.transparent,
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: ElevatedButton(onPressed: confirm,  child: Text('Confirmer')),
    ),
  );
}
