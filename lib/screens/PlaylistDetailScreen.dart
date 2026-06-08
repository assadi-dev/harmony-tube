import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/bloc/playlist/playlist_bloc.dart';
import 'package:harmony_tube/bloc/playlist/playlist_event.dart';
import 'package:harmony_tube/bloc/playlist/playlist_state.dart';
import 'package:harmony_tube/config/app_config.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist.dart';
import 'package:harmony_tube/cubit/selected_items.dart';

import 'playlist_details/playlist_detail_silver_widgets.dart';

class PlaylistDetailScreen extends StatefulWidget {
  final String id;
  final String? title;

  const PlaylistDetailScreen({super.key, required this.id, this.title});

  @override
  State<PlaylistDetailScreen> createState() => _PlaylistDetailScreenState();
}

class _PlaylistDetailScreenState extends State<PlaylistDetailScreen> {
  PlaylistBloc? _playlistBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _playlistBloc = context.read<PlaylistBloc>();
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      BlocProvider.of<SelectedItemsCubit>(context).clearAll();
      context.read<PlaylistBloc>().add(FindPlaylist(playlistId: widget.id));
    });
  }

  @override
  void dispose() {
    _playlistBloc?.add(const ClearPlaylist());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaylistBloc, PlaylistState>(
      buildWhen: (prev, curr) =>
          prev.playlist != curr.playlist ||
          prev.isLoading != curr.isLoading ||
          prev.error != curr.error,
      builder: (context, state) {
        if (state.playlist == null) {
          return Scaffold(
            appBar: AppBar(title: Text(widget.title ?? 'Playlist')),
            body: Center(
              child: state.error != null
                  ? Text('Erreur : ${state.error!.message}')
                  : const CircularProgressIndicator(),
            ),
          );
        }
        return _PlaylistDetailBody(playlistItem: state.playlist!, id: widget.id);
      },
    );
  }
}

class _PlaylistDetailBody extends StatelessWidget {
  final PlaylistItemModel playlistItem;
  final String id;

  const _PlaylistDetailBody({required this.playlistItem, required this.id});

  @override
  Widget build(BuildContext context) {
    final silverWidget = playlist_detail_silver_widgets(context: context);
    final double silverPaddingSize = paddingLayout;
    final playlistTracks = playlistItem.tracks;

    return Scaffold(
      body: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          SliverLayoutBuilder(
            builder: (context, constraints) {
              return silverWidget.silverHeader(
                context: context,
                constraints: constraints,
                playlistId: id,
                title: playlistItem.title,
                imageSrc: noCoverImage,
                playlistItem: playlistItem,
              );
            },
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              left: silverPaddingSize,
              right: silverPaddingSize,
            ),
            sliver: silverWidget.sliverToBoxPlaylistActions(),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              left: silverPaddingSize,
              right: silverPaddingSize,
              bottom: 70 + MediaQuery.of(context).viewPadding.bottom,
            ),
            sliver: silverWidget.silverTrackListSliver(playlistTracks),
          ),
        ],
      ),
    );
  }
}
