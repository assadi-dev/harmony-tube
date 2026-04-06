import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:harmony_tube/modules/bottom_navigations/bloc/bottom_bar_cubit.dart';
import 'package:harmony_tube/modules/bottom_navigations/data/bottom_bar_list_Items.dart';

class AppBottomNavigation extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const AppBottomNavigation({super.key, required this.navigationShell});

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
        child: Container(
          color: Colors.blueGrey.withAlpha(50),
          child: BlocBuilder<BottomBarCubit, BottomBarState>(
            builder: (BuildContext context, BottomBarState state) {
              return BottomNavigationBar(
                type: BottomNavigationBarType.fixed,

                elevation: 0,
                unselectedFontSize: 10,
                selectedItemColor: Colors.blueAccent,
                unselectedItemColor: Colors.blueGrey.withAlpha(70),
                iconSize: 25,
                selectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 11,
                ),

                currentIndex: navigationShell.currentIndex,
                onTap: _onTap,
                items: items(),
              );
            },
          ),
        ),
      ),
    );
  }
}

List<BottomNavigationBarItem> items() {
  final listItems = BottomBarListItems.listItems.map(
    (item) => BottomNavigationBarItem(icon: Icon(item.icon), label: item.label),
  );

  return listItems.toList();
}
