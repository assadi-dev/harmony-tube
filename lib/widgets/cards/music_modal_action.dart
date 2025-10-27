

import 'package:flutter/material.dart';
import 'package:harmony_tube/core/models/local_track.dart';
import 'package:harmony_tube/widgets/cards/music_header_bottom_sheet.dart';

class MusicModalAction extends StatelessWidget {
  final Widget child;
  final TrackItemModel trackItem;

  const MusicModalAction({
    super.key,
    required this.trackItem,
    this.child = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      spacing: 10,
      children: [
        MusicHeaderBottomSheet(
          title: trackItem.title,
          description:trackItem.artist ,
        ),
        Divider(
          height: 5,
          color: Colors.black12,
        ),
        child
      ],
    );


  }


}






