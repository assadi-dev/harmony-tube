import 'package:flutter/material.dart';
import 'package:harmony_tube/widgets/app_text_theme.dart';
import 'package:harmony_tube/widgets/woltPages/GoBackModal.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

SliverWoltModalSheetPage PlaylistSelect(BuildContext context) {

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
            (_, index) => ListTile(title: Text('Playlist ${index + 1}')),
            childCount: 25,
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
