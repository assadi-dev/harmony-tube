import 'package:flutter/material.dart';
import 'package:harmony_tube/services/track_more_action_handler.dart';
import 'package:harmony_tube/widgets/text_with_icon_gesture.dart';

class TrackModalActionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

final moreHandler = TrackMoreActionHandler(context:context);

    return Container(
        constraints: BoxConstraints(minHeight: MediaQuery
            .of(context)
            .size
            .height * 0.25,),
        padding: EdgeInsets.all(15),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 24, children: <Widget>[

          TextWithIconGesture(text:"Jouer tout les morceaux" ,  onTap: moreHandler.playAll, icon: Icons.play_arrow_outlined),
          TextWithIconGesture(text: "Ajouter un morceau" ,  onTap: moreHandler.addTrack, icon: Icons.playlist_add_outlined),
          TextWithIconGesture(text: "Mélanger les morceaux" ,  onTap: moreHandler.shuffleAll, icon: Icons.shuffle_outlined),

        ]));
  }
}


