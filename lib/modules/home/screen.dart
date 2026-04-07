import 'package:flutter/material.dart';
import 'package:harmony_tube/config/app_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(app_title)),
      body: Placeholder(),
    );
  }
}
