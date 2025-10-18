import 'package:flutter/material.dart';
import 'package:harmony_tube/config/app_config.dart';
import 'package:harmony_tube/themes/app_colors.dart';
import 'package:harmony_tube/widgets/responsive_icon.dart';

class PreviewPlaylistImage extends StatefulWidget {

  final String? source;
  const PreviewPlaylistImage({super.key,this.source});


  @override
  State<PreviewPlaylistImage> createState() => _PreviewPlaylistImageState();
}

class _PreviewPlaylistImageState extends State<PreviewPlaylistImage> {
  @override
  Widget build(BuildContext context) {
      return Container(
      height: preview_picture_small,
      width: preview_picture_small,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.white,
            AppColors.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(border_radius_card),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 8)),
        ],
      ),
      child: ResponsiveIcon(
        icon: Icons.library_music_outlined,
        color:  AppColors.grey,
        scaleFactor: 1,
      ),
    );
  }
}

