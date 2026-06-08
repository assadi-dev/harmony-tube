import 'package:get_it/get_it.dart';
import 'package:harmony_tube/core/data/playlist/in_memory_playlist_repository.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist_repository.dart';

Future<void> repositoriesInjector(final GetIt injector) async {
  final playlistRepository = InMemoryPlaylistRepository();

  injector.registerLazySingleton<PlaylistRepository>(() => playlistRepository);
  injector.registerLazySingleton<PlaylistTrackRepository>(
    () => playlistRepository,
  );
}
