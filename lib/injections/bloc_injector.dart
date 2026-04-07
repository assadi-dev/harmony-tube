import 'package:get_it/get_it.dart';
import 'package:harmony_tube/bloc/playlist/playlist_bloc.dart';
import 'package:harmony_tube/bloc/track/track_bloc.dart';
import 'package:harmony_tube/cubit/selected_items.dart';
import 'package:harmony_tube/cubit/theme_mode_cubit.dart';
import 'package:harmony_tube/modules/bottom_navigations/bloc/bottom_bar_cubit.dart';
import 'package:harmony_tube/modules/home/bloc/categories/categories_bloc.dart';
import 'package:harmony_tube/modules/home/bloc/categories/categories_chip_cubit.dart';

import '../cubit/select_mode_cubit.dart' show SelectModeStateCubit;

Future<void> blocInjector(final GetIt injector) async {
  injector.registerFactory<ThemeModeCubit>(() => ThemeModeCubit());

  injector.registerFactory<SelectedItemsCubit>(() => SelectedItemsCubit());
  injector.registerFactory<SelectModeStateCubit>(() => SelectModeStateCubit());

  injector.registerFactory<PlaylistBloc>(() => PlaylistBloc());

  injector.registerFactory<TrackBloc>(() => TrackBloc());

  injector.registerFactory<BottomBarCubit>(() => BottomBarCubit());

  injector.registerFactory<CategoriesChipCubit>(() => CategoriesChipCubit());
  injector.registerFactory<CategoriesBloc>(() => CategoriesBloc());
}
