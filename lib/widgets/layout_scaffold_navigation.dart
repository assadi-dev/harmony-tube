import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:harmony_flow/widgets/music_player_screen.dart';

class LayoutScaffoldNavigation extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const LayoutScaffoldNavigation({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {


    final isBottomNavBarVisible = true;
       // context.watch<BottomBarCubit>().state.isBottomNavBarVisible;

    return Scaffold(
      //extendBody: true,
      body: Stack(
        children: [
          navigationShell,
          Align(
            alignment: Alignment.bottomCenter,
            child: MusicPlayerScreen(),
          ),
        ],
      ),

    );
  }
}
