import 'package:flutter/material.dart';
class BottomNavigationItemModel {
  final IconData icon;
  final String label;
  final Widget screen;
  final String path;
  final String? name;

  BottomNavigationItemModel({
    required this.icon,
    required this.label,
    required this.screen,
    required this.path,
    this.name,
  });
}
