import 'package:flutter/material.dart';
import 'package:harmony_tube/widgets/cards/playlist_header_bottom_sheet.dart';

class PlaylistModalAction extends StatelessWidget {
  final Widget child;
  const PlaylistModalAction({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return    Column(
      children: [
        PlaylistHeaderBottomSheet(
          title: "Playlist sans titre",
        ),
        Divider(
          height: 5,
          color: Colors.black12,
        ),
        SizedBox(height: 10,),
        child
      ],
    );
  }
}




