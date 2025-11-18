

import 'package:get_it/get_it.dart';
import 'package:harmony_tube/bloc/playlist/playlist_bloc.dart';
import 'package:harmony_tube/bloc/track/track_bloc.dart';
import 'package:harmony_tube/cubit/selected_items.dart';
import 'package:harmony_tube/cubit/theme_mode_cubit.dart';

Future<void> blocInjector(final GetIt injector) async {

  injector.registerFactory<ThemeModeCubit>(
        () => ThemeModeCubit(),
  );

  injector.registerFactory<SelectedItemsCubit>(
        () => SelectedItemsCubit(),
  );

  injector.registerFactory<PlaylistBloc>(
        () => PlaylistBloc(),
  );

  injector.registerFactory<TrackBloc>(
        () => TrackBloc(),
  );


}