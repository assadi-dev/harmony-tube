import 'package:flutter/material.dart';
import 'package:harmony_tube/config/app_config.dart';
import 'package:harmony_tube/screens/playlist_screens/modals/create_playlist_modal.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class PlaylistHeader extends StatelessWidget {
  const PlaylistHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [Spacer(), AddPlaylistButton()],
      ),
    );
  }
}

class HeaderTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.library_music_outlined),
        SizedBox(width: 10),
        Text(
          "Ma bibliotèque",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}


class AddPlaylistButton extends StatefulWidget {
  const AddPlaylistButton({super.key});
  @override
  State<AddPlaylistButton> createState() => AddPlaylistButtonState();

}

class AddPlaylistButtonState extends State<AddPlaylistButton> {

  void openModal(BuildContext context) {
    WoltModalSheet.show(
      modalTypeBuilder: (context) =>WoltModalType.dialog(),
      context: context,
        pageListBuilder: (context){
        return [
          SliverWoltModalSheetPage(

            trailingNavBarWidget: IconButton(
              padding: const EdgeInsets.all(3),
              icon: const Icon(Icons.close,size:close_icon_size),
              onPressed: Navigator.of(context).pop,
            ),
            mainContentSliversBuilder: (context) => [
              SliverToBoxAdapter(
                child: CreatePlaylistModal(context: context),
              ),
            ],
          )
        ];
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton.icon(
          onPressed: () =>openModal(context),
          icon: Icon(Icons.add),
          label: Text("Ajouter une playlist"),
          style: ButtonStyle(elevation: WidgetStateProperty.all(0)),
        ),
      ],
    );
  }
}


