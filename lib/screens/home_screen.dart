import 'package:flutter/material.dart';
import 'package:harmony_tube/config/app_config.dart';
import 'package:harmony_tube/screens/home/all_songs_container.dart';
import 'package:harmony_tube/themes/app_colors.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  final textColor = AppColors.monochromatic;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:AllSongsContainer(),
    );
  }
 
}