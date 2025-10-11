
import 'package:flutter/material.dart';
import 'package:harmony_flow/routes/router_base_config.dart';
import 'package:harmony_flow/themes/app_themes.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Harmony Flow',
      theme:themeApp.light,
      darkTheme: themeApp.dark,
      themeMode: ThemeMode.light,
      routerConfig: RouterBaseConfig.router,
    );
  }
}
