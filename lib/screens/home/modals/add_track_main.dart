import 'package:flutter/material.dart';
import 'package:harmony_tube/services/track_more_action_handler.dart';
import 'package:harmony_tube/themes/app_colors.dart';
import 'package:harmony_tube/widgets/app_text_theme.dart';
import 'package:harmony_tube/widgets/form/youtube_id_or_url_form.dart';
import 'package:harmony_tube/widgets/text_with_icon_gesture.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

SliverWoltModalSheetPage AddTrackMain(BuildContext context) {
  void goBack() {
    WoltModalSheet.of(context).showPrevious();
  }

  final trackHandler =TrackMoreActionHandler(context: context);

  return SliverWoltModalSheetPage(
    topBarTitle: AppTextTheme("Ajouter un morceau"),
    leadingNavBarWidget: IconButton(
      onPressed: goBack,
      icon: Icon(Icons.arrow_back_ios_new, size: 20),

    ),
    isTopBarLayerAlwaysVisible: true,

    mainContentSliversBuilder: (context) => [
      SliverToBoxAdapter(
        child: Container(
          padding: EdgeInsets.all(15),
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height * 0.35,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 24,
            children: [
              YoutubeIdOrUrlForm(),
              TextWithIconGesture(
                text: "Depuis mes musiques",
                icon: Icons.music_video_outlined,
                onTap: trackHandler.openAudioFiles,
              ),
              TextWithIconGesture(
                text:  "Depuis le Gestionnaire des fichiers",
                icon: Icons.folder_open_outlined,
                onTap: trackHandler.openFileManager,
              ),
            ],
          ),
        ),
      ),
    ],
  );
}


