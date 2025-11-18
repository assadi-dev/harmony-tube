import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist.dart';
import 'package:harmony_tube/widgets/cards/playlist_card.dart';

class PlaylistSelectRadio extends StatefulWidget {

  final PlaylistItemModel playlist;

  const PlaylistSelectRadio({super.key, required this.playlist});

  @override
  _PlaylistSelectRadioState createState() => _PlaylistSelectRadioState();



}

class _PlaylistSelectRadioState extends State<PlaylistSelectRadio> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {


    var title = widget.playlist.title ?? "Artist inconnu";
    var id = widget.playlist.id ;
    var backgroundColor = selected ? Colors.transparent : Colors.transparent;
    var textColor = selected ? Colors.white : Colors.black;
    var iconColor = selected ? Colors.white : Colors.black;
    var icon = selected ? Icons.radio_button_checked : Icons.radio_button_unchecked;





    return Card(
  elevation: 0,
        color: backgroundColor,
        child: ListTile(
          leading: PlaylistCardPreview(widget.playlist),
          title: Text(title, style: TextStyle(fontSize: 14)),
          subtitle: Text('Subtitle', style: TextStyle(fontSize: 10)),
          trailing: Icon(icon),
          contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 2),
          dense: true,

          selected: selected,
          onTap: () {
           setState(() {
             selected = !selected;
           });
          },
        ),
      );

  }
}


