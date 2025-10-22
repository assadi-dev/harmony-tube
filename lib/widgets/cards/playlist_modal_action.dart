import 'package:flutter/material.dart';
import 'package:harmony_tube/widgets/cards/playlist_header_bottom_sheet.dart';

class PlaylistModalAction extends StatelessWidget {
  final String title;
  final Widget child;
  const PlaylistModalAction({super.key,required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return    Column(

      children: [
        PlaylistHeaderBottomSheet(
          title: title,
        ),
        Divider(
          height: 5,
          color: Colors.black12,
        ),

      Padding(padding:EdgeInsets.symmetric(vertical: 10) ,child: child)
      ],
    );
  }
}




