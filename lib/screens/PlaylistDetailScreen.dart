import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/bloc/playlist/playlist_bloc.dart';
import 'package:harmony_tube/bloc/playlist/playlist_event.dart';
import 'package:harmony_tube/config/app_config.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist.dart';

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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final playlistId = widget.id;
      playlistTitle = widget.title ?? "Sans titre";

      context.read<PlaylistBloc>()
           .add(FindPlaylist(playlistId: playlistId));
    });
  }

  @override
  void dispose() {
    super.dispose();
    print("Playlist dispose");

  }

  @override
  Widget build(BuildContext context) {
    final silverWidget = playlist_detail_silver_widgets(context: context);
    final double silverPaddingSize = padding_layout;
    context.watch<PlaylistBloc>().state;



    final  playlistItem = context.read<PlaylistBloc>().state.playlist as PlaylistItemModel;

    final appBarTitle = playlistItem.title;

    return Scaffold(

      body: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [SliverLayoutBuilder(
          builder: (context, constraints) {
           return silverWidget.silverHeader(context: context,constraints: constraints, playlistId: widget.id, title: appBarTitle,imageSrc: no_cover_image,playlistItem: playlistItem);
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