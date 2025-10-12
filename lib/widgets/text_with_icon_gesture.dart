import 'package:flutter/material.dart';
import 'package:harmony_tube/widgets/app_text_theme.dart';

class TextWithIconGesture extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onTap;

  const TextWithIconGesture({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,
      child: Row( crossAxisAlignment: CrossAxisAlignment.center, spacing: 12, children: [Icon(icon), AppTextTheme(text)]),
    );
  }
}
