import 'package:flutter/material.dart';
import 'package:harmony_tube/config/app_config.dart';

class MoreIconButton extends StatelessWidget {
  final void Function()? onPress;
  const MoreIconButton({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onPress,
      child:Ink(
        child:  Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Icon(Icons.more_vert, size: more_icon_size,),),
      ),
      );
  }
}