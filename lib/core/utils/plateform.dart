
import 'package:flutter/widgets.dart';
import 'dart:io';

bool isTablet(BuildContext context) {
  final width = MediaQuery.of(context).size.shortestSide;
  return width >= 600;
}

bool isAndroid = Platform.isAndroid;
bool isIOS = Platform.isIOS;