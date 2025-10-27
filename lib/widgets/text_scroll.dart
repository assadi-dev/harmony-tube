

import 'package:flutter/material.dart';
import 'package:text_scroll/text_scroll.dart';

class TextHorizontalScroll extends StatelessWidget {
  final String text;
  TextStyle? style;
    TextHorizontalScroll({super.key,  required this.text,this.style});



  @override
  Widget build(BuildContext context) {
 TextStyle currentStyle = TextStyle(fontWeight: FontWeight.normal, fontSize: 14.0);
    return TextScroll(
      text ,
      style:  style != null ? currentStyle.merge(style): currentStyle,
      pauseOnBounce: Duration(milliseconds: 3500),
      mode: TextScrollMode.bouncing,
      delayBefore: Duration(milliseconds: 2000),
      pauseBetween: Duration(milliseconds: 3500),
      velocity: Velocity(pixelsPerSecond: Offset(50, 0)),
    );
  }


}