import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/bloc/playlist/playlist_bloc.dart';
import 'package:harmony_tube/bloc/playlist/playlist_event.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist.dart';
import 'package:harmony_tube/screens/playlist_screens/models/model.dart';
import 'package:harmony_tube/widgets/form/playlist_form.dart';

class CreatePlaylistModal extends StatelessWidget {
  final BuildContext context;
  const CreatePlaylistModal({super.key, required this.context});



  Future<void> createPlaylist(PlaylistFormValues values) async {

    final serialized = PlaylistFormValues.toPlaylistItemModel(values);
    final playlistModel = PlaylistItemModel.generate(serialized);
    context.read<PlaylistBloc>().add(CreatePlaylist(playlistModel));
    Navigator.of(context).pop();

  }


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: PlaylistForm(handleSubmitted:createPlaylist,defaultValues: PlaylistFormValues.empty(), )
    );
  }
}