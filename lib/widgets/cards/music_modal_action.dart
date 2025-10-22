

import 'package:flutter/material.dart';
import 'package:harmony_tube/widgets/cards/music_header_bottom_sheet.dart';

class MusicModalAction extends StatelessWidget {
  final String title;
  final Widget child;

  const MusicModalAction({
    super.key,
    required this.title,
    this.child = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      spacing: 10,
      children: [
        MusicHeaderBottomSheet(
          title: title,
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






