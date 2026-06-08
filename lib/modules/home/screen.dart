import 'package:flutter/material.dart';
import 'package:harmony_tube/config/app_config.dart';
import 'package:harmony_tube/modules/home/widget/categories_chip.dart';
import 'package:harmony_tube/modules/home/widget/categories_sections.dart';
import 'package:harmony_tube/modules/home/widget/google_sign_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appTitle)),
      body: Column(
        children: [CategoriesChip(), CategoriesSections(), GoogleSignButton()],
      ),
    );
  }
}
