import 'package:get_it/get_it.dart';
import 'package:harmony_tube/config/app_config.dart';
import 'package:harmony_tube/core/services/google_auth_service.dart';
import 'package:logger/logger.dart';

Future<void> servicesInjector(final GetIt injector) async {
  injector.registerLazySingleton<Logger>(() => Logger());

  injector.registerLazySingleton<GoogleAuthService>(
    () => GoogleAuthService(serverClientId: googleWebClientId),
  );
}
