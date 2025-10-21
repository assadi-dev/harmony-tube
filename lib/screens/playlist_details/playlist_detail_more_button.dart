import 'package:flutter/material.dart';

class PlaylistDetailMoreButton extends StatelessWidget {
  final String playlistId;
  final String title;
   PlaylistDetailMoreButton({super.key,required this.playlistId,required this.title});
  final playlistDetailMoreHandler = PlaylistDetailMoreHandler();

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: playlistDetailMoreHandler.onPressMoreButton, icon: const Icon(Icons.more_vert));
  }
}

class PlaylistDetailMoreHandler {

  void onPressMoreButton(){
    print('More button pressed');

  }

}