import 'package:flutter/material.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Mes Playlists"),
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
          children: [Text("Mes Playlists")],
        ),
      ),
    );
  }
}