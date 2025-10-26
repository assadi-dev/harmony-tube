import 'package:flutter/material.dart';
import 'package:harmony_tube/widgets/text_with_icon_gesture.dart';

class TrackModalActionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    void closeModal() {
      Navigator.of(context).pop();
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
        padding: EdgeInsets.all(15),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 24, children: <Widget>[
          TextWithIconGesture(text:"Jouer tout les morceaux" ,  onTap: closeModal, icon: Icons.play_arrow_outlined),
          TextWithIconGesture(text: "Ajouter un morceau" ,  onTap: closeModal, icon: Icons.playlist_add_outlined),
          TextWithIconGesture(text: "Rechercher sur Youtube" ,  onTap: closeModal, icon: Icons.search_outlined),

        ]));
  }
}


