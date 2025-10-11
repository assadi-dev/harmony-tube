
import 'package:flutter/material.dart';

class LayoutScrollView extends StatelessWidget {
  final Widget child;

  LayoutScrollView({required this.child});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: EdgeInsets.only(bottom: 100),
      child: child,
    );
  }
}
