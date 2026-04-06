import 'package:flutter/material.dart';

class LayoutScrollView extends StatelessWidget {
  final Widget child;

  const LayoutScrollView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: EdgeInsets.only(bottom: 100),
      child: child,
    );
  }
}
