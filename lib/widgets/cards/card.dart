import 'package:flutter/material.dart';
import 'package:harmony_tube/config/app_config.dart';
import 'package:harmony_tube/themes/app_colors.dart';

class Card extends StatelessWidget {

  final Widget child;

  const Card({super.key, required this.child});

  @override
  Widget build(BuildContext context) {

    final Color borderColor = Color(Colors.grey.value).withAlpha(50);
    final backgroundColor =  Theme.of(context).scaffoldBackgroundColor;
    final shadowColor = Color(Colors.black.value).withAlpha(100);


    return Container(
      padding: EdgeInsets.all(padding_card),

      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          style: BorderStyle.solid,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(border_radius_card),
        boxShadow:[ BoxShadow(color: shadowColor,spreadRadius:0 ,blurRadius: 1),  BoxShadow(
          color:backgroundColor,
          spreadRadius: 5,
          blurRadius: 8,
        ),],

      ),
      child: child

    );
  }
}
