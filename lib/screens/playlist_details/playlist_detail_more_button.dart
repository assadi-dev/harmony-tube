import 'package:flutter/material.dart';
import 'package:harmony_tube/widgets/cards/playlist_card.dart';

class PlaylistDetailMoreButton extends StatelessWidget {
  final String playlistId;
  final String title;
   PlaylistDetailMoreButton({super.key,required this.playlistId,required this.title});


  @override
  Widget build(BuildContext context) {
    final playlistDetailMoreHandler = PlaylistDetailMoreHandler(playlistId: playlistId,context: context);
    return IconButton(onPressed: playlistDetailMoreHandler.onPressMoreButton, icon: const Icon(Icons.more_vert));
  }
}

class PlaylistDetailMoreHandler {

  final BuildContext context;
  final String playlistId;
  late PlaylistModalBottomSheet modalBottomSheet;


  PlaylistDetailMoreHandler({required this.context, required this.playlistId}){
     modalBottomSheet = PlaylistModalBottomSheet(
      context: context,
      moreOptionWidget: PlaylistMoreOptionList(playlistId: playlistId),
    );
  }


  void onPressMoreButton(){
    modalBottomSheet.openModal();

  }

}