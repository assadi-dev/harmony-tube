import 'package:flutter/material.dart';
import 'package:harmony_tube/widgets/Buttons/more_button.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

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

            return [
              SliverWoltModalSheetPage(

              hasTopBarLayer: false,
                mainContentSliversBuilder: (context) =>
                [
                  SliverToBoxAdapter(

                    child: TrackModalActionList(),
                  ),
                ],
              )
            ];
          }
      );
    }

    return MoreIconButton(onPress: () => open());
  }
}

