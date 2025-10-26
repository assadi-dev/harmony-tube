import 'package:flutter/material.dart';
import 'package:harmony_tube/config/app_config.dart';

class MoreIconButton extends StatelessWidget {
  final void Function()? onPress;
  final double? size;
  const MoreIconButton({super.key, required this.onPress,this.size=more_icon_size});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPress,
      icon: Icon(Icons.more_vert,size: size,),);
  }
}