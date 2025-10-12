import 'package:flutter/material.dart' hide Card;
import 'package:harmony_tube/config/app_config.dart';
import 'package:harmony_tube/widgets/app_text_theme.dart';
import 'package:harmony_tube/widgets/cards/card.dart';

class MusicCard extends StatelessWidget {
  const MusicCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8,
          children: [MediaPreview(), MediaInfos()],
        ),
      ),
    );
  }
}

class MediaPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: preview_picture_small,
      height: preview_picture_small,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(border_radius_card),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(border_radius_card),
        child: Image.asset(no_cover_image,  fit: BoxFit.cover,),
      ),
    );
  }
}

class MediaInfos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppTextTheme("Music sans titre"),
        AppTextTheme("Artist inconnu", color: Colors.grey.shade500),
      ],
    );
  }
}
