import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/bloc/track/track_bloc.dart';
import 'package:harmony_tube/core/models/local_track.dart';
import 'package:harmony_tube/screens/home/modals/add_track_main.dart';
import 'package:harmony_tube/screens/home/modals/track_more_action_view.dart';
import 'package:harmony_tube/widgets/Buttons/more_button.dart';
import 'package:harmony_tube/widgets/woltPages/PlaylistSelect.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../cubit/selected_items.dart';
import 'track_modal_action_list.dart';

class MoreTrackActions extends StatelessWidget {
  const MoreTrackActions({super.key});

  @override
  Widget build(BuildContext context) {
    void open() {
      WoltModalSheet.show(

          context: context,
          showDragHandle: false,
          modalTypeBuilder: (context) => WoltModalType.bottomSheet(),
          pageListBuilder: (context) {
            List<TrackItemModel> trackItems = getTrackItemsFromSelection(context);
            return [
              TrackMoreAction(context),
              AddTrackMain(context),
              PlaylistSelect(context,trackItems)
            ];
          }
      );
    }

    return MoreIconButton(onPress: () => open());
  }

  List<String> getTrackIds(BuildContext context) {

    List<String> selectedItems = BlocProvider.of<SelectedItemsCubit>(context).state.fromItems;
    return selectedItems;

  }

  List<TrackItemModel> getTrackItemsFromSelection(BuildContext context) {
    List<TrackItemModel> trackItems = [];

    List<String> selectedItems = BlocProvider.of<SelectedItemsCubit>(context).state.fromItems;

    if(selectedItems.isNotEmpty) {
      for(String id in selectedItems) {
        TrackItemModel?  trackItem = BlocProvider.of<TrackBloc>(context).state.collections.firstWhere((element) => element.id == id);
        if(trackItem != null) {
          trackItems.add(trackItem);
        }

      }
    }

    return trackItems;

  }



}

