import 'package:flutter/material.dart';
import 'package:harmony_tube/themes/app_colors.dart';
import 'package:harmony_tube/widgets/responsive_icon.dart';

const double previewPlaylistSize = 150;
const double borderRadius = 10;

class PlaylistDetailHeader extends StatelessWidget {
  const PlaylistDetailHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PreviewImage(),
      ],
    );
  }
}


class PreviewImage extends StatelessWidget {
  const PreviewImage({super.key});

  @override
  Widget build(BuildContext context) {
 return   Container(
   decoration: BoxDecoration(
     borderRadius: BorderRadius.circular(borderRadius),
     color: AppColors.cream,
     boxShadow: [
       BoxShadow(
         color: Colors.black45,
         blurRadius: 8,
         offset: Offset(0, 8),
       ),
     ],
   ),
   child: ClipRRect(
     borderRadius: BorderRadius.circular(borderRadius),

     child: Container(
       padding: EdgeInsets.all(15),
       decoration: BoxDecoration(
         color: AppColors.cream,
         boxShadow: [
           BoxShadow(
             color: Colors.black45,
             blurRadius: 8,
             offset: Offset(0, 8),
           ),
         ],
       ),
       child: SizedBox(
         width: previewPlaylistSize,
         height: previewPlaylistSize,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             ResponsiveIcon(
               icon: Icons.library_music_outlined,
               scaleFactor: 0.6,
               color: AppColors.grey,
             ),
           ],
         ),
       ),
     ),
   ),
 );
  }

}