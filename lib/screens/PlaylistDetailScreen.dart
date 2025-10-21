import 'package:flutter/material.dart';
import 'package:harmony_tube/config/app_config.dart';

import 'playlist_details/playlist_detail_silver_widgets.dart';

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


      // Exemple : déclencher un BLoC
      // context.read<LocalPlaylistBloc>()
      //     .add(GetPlaylistDetailEvent(id: playlistId));
    });
  }

  @override
  Widget build(BuildContext context) {
    final silverWidget = playlist_detail_silver_widgets(context: context);
    final double silverPaddingSize = 15.0;

    /// Priorité : prop.title > titre chargé > fallback
    final appBarTitle = widget.title ??
        (playlistTitle.isNotEmpty ? playlistTitle : "Playlist");

    return Scaffold(

      body: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [SliverLayoutBuilder(
          builder: (context, constraints) {
           return silverWidget.silverHeader(context: context,constraints: constraints, playlistId: widget.id, title: appBarTitle,imageSrc: no_cover_image);
          }
        ),
          SliverPadding(
            padding: EdgeInsets.only(
              left: silverPaddingSize,
              right: silverPaddingSize,),
            sliver: silverWidget.sliverToBoxPlaylistActions(),

          ),


          SliverPadding(
            padding: EdgeInsets.only(
              left: silverPaddingSize,
              right: silverPaddingSize,
              bottom: 70 + MediaQuery
                  .of(context)
                  .viewPadding
                  .bottom,
            ),
            sliver: silverWidget.silverTrackListSliver(),
          ),
        ],
      )
      ,
    );
  }
}