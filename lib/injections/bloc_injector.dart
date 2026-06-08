import 'package:get_it/get_it.dart';
import 'package:harmony_tube/bloc/playlist/playlist_bloc.dart';
import 'package:harmony_tube/bloc/playlist_tracks/playlist_tracks_bloc.dart';
import 'package:harmony_tube/bloc/track/track_bloc.dart';
import 'package:harmony_tube/cubit/auth/auth_cubit.dart';
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

  injector.registerFactory<PlaylistBloc>(
    () => PlaylistBloc(playlistUsecase: injector()),
  );

  injector.registerFactory<PlaylistTracksBloc>(
    () => PlaylistTracksBloc(playlistUsecase: injector()),
  );

  injector.registerFactory<TrackBloc>(
    () => TrackBloc(trackUsecase: injector()),
  );

  injector.registerFactory<BottomBarCubit>(() => BottomBarCubit());

  injector.registerFactory<CategoriesChipCubit>(() => CategoriesChipCubit());
  injector.registerFactory<CategoriesBloc>(() => CategoriesBloc());

  injector.registerFactory<AuthCubit>(
    () => AuthCubit(googleAuthService: injector()),
  );
}
