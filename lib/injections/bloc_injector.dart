

import 'package:get_it/get_it.dart';
import 'package:harmony_tube/bloc/playlist/playlist_bloc.dart';
import 'package:harmony_tube/cubit/theme_mode_cubit.dart';

Future<void> blocInjector(final GetIt injector) async {

  injector.registerFactory<ThemeModeCubit>(
        () => ThemeModeCubit(),
  );
  injector.registerFactory<PlaylistBloc>(
        () => PlaylistBloc(),
  );

}