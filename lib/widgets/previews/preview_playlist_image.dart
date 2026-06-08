import 'package:flutter/material.dart';
import 'package:harmony_tube/config/app_config.dart';
import 'package:harmony_tube/themes/app_colors.dart';
import 'package:harmony_tube/widgets/responsive_icon.dart';

class PreviewPlaylistImage extends StatefulWidget {
  final String? source;
  const PreviewPlaylistImage({super.key, this.source});

  @override
  State<PreviewPlaylistImage> createState() => _PreviewPlaylistImageState();
}

class _PreviewPlaylistImageState extends State<PreviewPlaylistImage> {
  @override
  Widget build(BuildContext context) {
    //selectedplaylist = context.read<PlaylistBloc>().state;

    return Container(
      height: previewPictureSmall,
      width: previewPictureSmall,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.white, AppColors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(borderRadiusCard),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 0.15,
            offset: Offset(0.5, 0.55),
          ),
        ],
      ),
      child: ResponsiveIcon(
        icon: Icons.library_music_outlined,
        color: AppColors.grey,
        scaleFactor: 1,
      ),
    );
  }
}
