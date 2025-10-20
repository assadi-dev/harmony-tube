import 'package:flutter/material.dart';
import 'package:harmony_tube/config/app_config.dart';

class PlaylistDetailScreen extends StatefulWidget {
  final String id;
  final String? title;

  const PlaylistDetailScreen({
    super.key,
    required this.id,
    this.title,
  });

  @override
  State<PlaylistDetailScreen> createState() => _PlaylistDetailScreenState();
}

class _PlaylistDetailScreenState extends State<PlaylistDetailScreen> {
  String playlistTitle = "";

  @override
  void initState() {
    super.initState();

    // Lance tes chargements/blocs après le premier frame si besoin
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final playlistId = widget.id;
      playlistTitle = widget.title ?? "Sans titre";

      print("Playlist id : $playlistId");
      print("Playlist title : $playlistTitle");

      setState(() {
        playlistTitle = "dddd";
      });

      // Exemple : déclencher un BLoC
      // context.read<LocalPlaylistBloc>()
      //     .add(GetPlaylistDetailEvent(id: playlistId));
    });
  }

  @override
  Widget build(BuildContext context) {
    // Priorité : prop.title > titre chargé > fallback
    final appBarTitle = widget.title ??
        (playlistTitle.isNotEmpty ? playlistTitle : "Playlist");

    return Scaffold(

      body: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            title: Text(appBarTitle),
            floating: false,
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(appBarTitle),
              background: Image.asset(
                no_cover_image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Pas de SliverList.separated : on gère la séparation à la main
          SliverList.separated(
            separatorBuilder: (context, index) => const Divider(height: 10),
            itemBuilder: (context, index) {
              return
                ListTile(title: Text('Track ${index + 1}'));
            },
            itemCount: 15,
          ),

        ],
      )
      ,
    );
  }
}
