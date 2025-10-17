import 'package:flutter/material.dart';
import 'package:harmony_tube/screens/playlist_screens/playlist_header.dart';

import 'playlist_screens/playlist_contents.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: PlaylistHeader(),
      ),
      body: SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [PlaylistContents()],
        ),
      ),
    );
  }
}