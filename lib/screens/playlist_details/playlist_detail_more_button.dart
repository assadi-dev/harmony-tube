import 'package:flutter/material.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist.dart';
import 'package:harmony_tube/widgets/cards/playlist_card.dart';

class PlaylistDetailMoreButton extends StatelessWidget {
  final String playlistId;
  final String title;
  final PlaylistItemModel playlistItem;
   PlaylistDetailMoreButton({super.key,required this.playlistId,required this.title, required this.playlistItem});


  @override
  Widget build(BuildContext context) {
    final playlistDetailMoreHandler = PlaylistDetailMoreHandler(playlistId: playlistId,context: context,playlistItem: playlistItem);
    return IconButton(onPressed: playlistDetailMoreHandler.onPressMoreButton, icon: const Icon(Icons.more_vert));
  }
}

class PlaylistDetailMoreHandler {

  final BuildContext context;
  final String playlistId;
  final PlaylistItemModel playlistItem;
  late PlaylistModalBottomSheet modalBottomSheet;


  PlaylistDetailMoreHandler({required this.context, required this.playlistId,required this.playlistItem}){
     modalBottomSheet = PlaylistModalBottomSheet(
      context: context,
      moreOptionWidget: PlaylistMoreOptionList(playlistId: playlistId),
       playlistItem: playlistItem
    );
  }


  void onPressMoreButton(){
    modalBottomSheet.openModal();

  }

}