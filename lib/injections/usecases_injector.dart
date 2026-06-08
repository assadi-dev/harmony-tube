import 'package:get_it/get_it.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist_usecase.dart';

Future<void> usecasesInjector(final GetIt injector) async {
  injector.registerFactory<PlaylistUsecase>(
    () => PlaylistUsecase(
      playlistRepository: injector(),
      playlistTrackRepository: injector(),
    ),
  );
}
