import 'package:flutter/material.dart';

class PlaylistDetailScreen extends StatefulWidget {

  final dynamic id;
  final String title;
  const PlaylistDetailScreen({super.key,required this.id,required this.title});

  @override
  State<PlaylistDetailScreen> createState() => _PlaylistDetailScreenState(id:id);
  
}

class _PlaylistDetailScreenState extends State<PlaylistDetailScreen> {
  final dynamic id;
  _PlaylistDetailScreenState({this.id});

  @override
  void initState() {
    super.initState();
   /* WidgetsBinding.instance.addPostFrameCallback((_) {
      final playlistId = this.id ?? "";
      BlocProvider.of<LocalPlaylistBloc>(context)
          .add(GetPlaylistDetailEvent(id: playlistId));


    });*/

  }

  @override
  Widget build(BuildContext context) {
    return Text("hello");
  }
}
