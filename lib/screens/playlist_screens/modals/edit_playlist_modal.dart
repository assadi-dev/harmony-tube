import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_tube/bloc/playlist/playlist_bloc.dart';
import 'package:harmony_tube/bloc/playlist/playlist_event.dart';
import 'package:harmony_tube/config/app_config.dart';
import 'package:harmony_tube/screens/playlist_screens/models/model.dart';
import 'package:harmony_tube/widgets/form/playlist_form.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class EditPlaylistForm extends StatelessWidget {
  final BuildContext context;

  EditPlaylistForm({super.key, required this.context});

  Future<void> editPlaylist(PlaylistFormValues values) async {
    final playlist = context.read<PlaylistBloc>().state.playlist;
    if (playlist == null) return;
    final serialized = PlaylistFormValues.toPlaylistItemModel(values);
    final playlistModel = playlist.copyWith(serialized);
    context.read<PlaylistBloc>().add(UpdatePlaylist(playlist: playlistModel));
    Navigator.of(context).pop();
  }

  PlaylistFormValues initDefaultValues() {
    final playlist = context.read<PlaylistBloc>().state.playlist;
    final defaultValues = playlist != null
        ? PlaylistFormValues(
            title: playlist.title ?? "",
            description: playlist.description ?? "",
          )
        : PlaylistFormValues.empty();
    return defaultValues;
  }

  @override
  Widget build(BuildContext context) {
    final defaultValues = initDefaultValues();
    return Container(
      padding: EdgeInsets.all(20),
      child: PlaylistForm(
        submitLabelButton: "Modifier",
        handleSubmitted: editPlaylist,
        defaultValues: defaultValues,
      ),
    );
  }
}

class EditPlaylistModal {
  final BuildContext context;

  EditPlaylistModal({required this.context});

  void open() {
    WoltModalSheet.show(
      modalTypeBuilder: (context) => WoltModalType.dialog(),
      context: context,
      pageListBuilder: (context) {
        return [
          SliverWoltModalSheetPage(
            trailingNavBarWidget: IconButton(
              padding: const EdgeInsets.all(3),
              icon: const Icon(Icons.close, size: close_icon_size),
              onPressed: Navigator.of(context).pop,
            ),
            mainContentSliversBuilder: (context) => [
              SliverToBoxAdapter(child: EditPlaylistForm(context: context)),
            ],
          ),
        ];
      },
    );
  }
}
