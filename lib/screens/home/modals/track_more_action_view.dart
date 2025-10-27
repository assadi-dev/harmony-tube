
import 'package:flutter/material.dart';
import 'package:harmony_tube/screens/home/track_modal_action_list.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

SliverWoltModalSheetPage TrackMoreAction(BuildContext context){

  return SliverWoltModalSheetPage(
    hasTopBarLayer: false,
    mainContentSliversBuilder: (context) =>
    [
      SliverToBoxAdapter(
        child: TrackModalActionList(),
      ),
    ],
  );

}