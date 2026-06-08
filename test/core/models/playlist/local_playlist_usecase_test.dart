import 'package:flutter_test/flutter_test.dart';
import 'package:harmony_tube/core/errors/failure.dart';
import 'package:harmony_tube/core/errors/result.dart';
import 'package:harmony_tube/core/models/local_track.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist_repository.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist_usecase.dart';
import 'package:mocktail/mocktail.dart';

class _MockPlaylistRepository extends Mock implements PlaylistRepository {}

class _MockPlaylistTrackRepository extends Mock
    implements PlaylistTrackRepository {}

void main() {
  late _MockPlaylistRepository playlistRepository;
  late _MockPlaylistTrackRepository trackRepository;
  late PlaylistUsecase usecase;

  final playlist = PlaylistItemModel(
    id: 'p1',
    title: 'Mix',
  );
  final track = TrackItemModel(id: 't1', title: 'Song', duration: 1000);

  setUpAll(() {
    registerFallbackValue(playlist);
    registerFallbackValue(track);
  });

  setUp(() {
    playlistRepository = _MockPlaylistRepository();
    trackRepository = _MockPlaylistTrackRepository();
    usecase = PlaylistUsecase(
      playlistRepository: playlistRepository,
      playlistTrackRepository: trackRepository,
    );
  });

  test('getPlaylistItems() forwards repository success', () async {
    when(playlistRepository.all)
        .thenAnswer((_) async => Result.success([playlist]));

    final result = await usecase.getPlaylistItems();

    expect(result.valueOrNull, [playlist]);
    verify(playlistRepository.all).called(1);
  });

  test('getPlaylistItems() wraps thrown errors in UnknownFailure', () async {
    when(playlistRepository.all).thenThrow(StateError('boom'));

    final result = await usecase.getPlaylistItems();

    expect(result.failureOrNull, isA<UnknownFailure>());
    expect(result.failureOrNull!.cause, isA<StateError>());
  });

  test('findPlaylist() delegates to repository.find()', () async {
    when(() => playlistRepository.find(playlistId: 'p1'))
        .thenAnswer((_) async => Result.success(playlist));

    final result = await usecase.findPlaylist('p1');

    expect(result.valueOrNull, playlist);
  });

  test('createPlaylist() delegates to repository.save()', () async {
    when(() => playlistRepository.save(playlist))
        .thenAnswer((_) async => const Result.success(null));

    final result = await usecase.createPlaylist(playlist);

    expect(result.isSuccess, true);
    verify(() => playlistRepository.save(playlist)).called(1);
  });

  test('addTrack() delegates to trackRepository.addTrack()', () async {
    when(() => trackRepository.addTrack(playlistId: 'p1', track: track))
        .thenAnswer((_) async => Result.success(playlist));

    final result = await usecase.addTrack(playlistId: 'p1', track: track);

    expect(result.isSuccess, true);
    verify(() => trackRepository.addTrack(playlistId: 'p1', track: track))
        .called(1);
  });

  test('removeTrack() delegates to trackRepository.removeTrack()', () async {
    when(() => trackRepository.removeTrack(playlistId: 'p1', trackId: 't1'))
        .thenAnswer((_) async => Result.success(playlist));

    final result = await usecase.removeTrack(playlistId: 'p1', trackId: 't1');

    expect(result.isSuccess, true);
  });
}
