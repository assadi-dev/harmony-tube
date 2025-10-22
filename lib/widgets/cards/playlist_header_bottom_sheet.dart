import 'package:flutter/material.dart';
import 'package:harmony_tube/config/app_config.dart';
import 'package:harmony_tube/widgets/app_text_theme.dart';
import 'package:harmony_tube/widgets/previews/preview_playlist_image.dart';

class PlaylistHeaderBottomSheet extends StatefulWidget {
  final String title;
  final String? subtitle;
  final String? imageSrc;

  const PlaylistHeaderBottomSheet({
    super.key,
    required this.title,
    this.subtitle,
    this.imageSrc,
  });

  @override
  State<PlaylistHeaderBottomSheet> createState() => _PlaylistHeaderBottomSheetState();
}

class _PlaylistHeaderBottomSheetState extends State<PlaylistHeaderBottomSheet> {
  late String title;
  String? description;
  String? imageSrc;

  @override
  void initState() {
    title = widget.title;
    description = widget.subtitle;
    imageSrc = widget.imageSrc;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 8,
          children: [
            PreviewPlaylistImage(source: imageSrc) ,
            TextColumn(title: title, description: description),
          ],
        ));
  }
}

class PreviewImage extends StatelessWidget {
  final String? source;
  const PreviewImage({super.key, this.source});

  final double icon_size = 50;

  @override
  Widget build(BuildContext context) {
    final double borderRadius = 5.0;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      width: icon_size,
      height: icon_size,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Image.asset(source ?? no_cover_image,fit: BoxFit.cover,),
      ),
    );

  }

}

class TextColumn extends StatelessWidget {

  final String title;
  final String? description;
  const TextColumn({super.key, required this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppTextTheme(title, style: TextStyle(fontWeight: FontWeight.bold)),
        AppTextTheme(description ?? ""),
      ],);
  }

}