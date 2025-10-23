import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/cubit/playlist/playlist_bloc.dart';
import 'package:harmony_tube/cubit/playlist/playlist_event.dart';
import 'package:harmony_tube/screens/playlist_screens/playlist_header.dart';
import 'playlist_screens/playlist_contents.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PlaylistBloc>().add(GetPlaylistCollections());
    return Scaffold(
      appBar: AppBar(

        title: PlaylistHeader(),
        scrolledUnderElevation: 0,
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [PlaylistContents()],
        ),
      ),
    );
  }
}