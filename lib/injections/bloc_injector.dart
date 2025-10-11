

import 'package:get_it/get_it.dart';
import 'package:harmony_tube/cubit/theme_mode_cubit.dart';

Future<void> blocInjector(final GetIt injector) async {

  injector.registerFactory<ThemeModeCubit>(
        () => ThemeModeCubit(),
  );

}