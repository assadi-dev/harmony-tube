import 'package:flutter_test/flutter_test.dart';
import 'package:harmony_tube/bloc/playlist_tracks/playlist_tracks_bloc.dart';
import 'package:harmony_tube/bloc/playlist_tracks/playlist_tracks_event.dart';
import 'package:harmony_tube/core/errors/failure.dart';
import 'package:harmony_tube/core/errors/result.dart';
import 'package:harmony_tube/core/models/local_track.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist_usecase.dart';
import 'package:mocktail/mocktail.dart';

class _MockPlaylistUsecase extends Mock implements PlaylistUsecase {}

void main() {
  late _MockPlaylistUsecase usecase;
  late PlaylistTracksBloc bloc;

  final track1 = TrackItemModel(id: 't1', title: 'Song 1', duration: 1000);
  final track2 = TrackItemModel(id: 't2', title: 'Song 2', duration: 1500);
  final playlist = PlaylistItemModel(id: 'p1', title: 'Mix');

  setUpAll(() {
    registerFallbackValue(track1);
    registerFallbackValue(playlist);
  });

  setUp(() {
    usecase = _MockPlaylistUsecase();
    bloc = PlaylistTracksBloc(playlistUsecase: usecase);
  });

  tearDown(() => bloc.close());

  test('AddTrackToPlaylist emits lastUpdated on success', () async {
    final updated = playlist.copyWith(tracks: [track1], nbTracks: 1);
    when(() => usecase.addTrack(playlistId: 'p1', track: track1))
        .thenAnswer((_) async => Result.success(updated));

    bloc.add(AddTrackToPlaylist(playlistId: 'p1', track: track1));
    await Future.delayed(Duration.zero);

    expect(bloc.state.lastUpdated, updated);
    expect(bloc.state.error, isNull);
  });

  test('AddTrackToPlaylist propagates Failure', () async {
    when(() => usecase.addTrack(playlistId: 'p1', track: track1)).thenAnswer(
      (_) async =>
          const Result.failure(NotFoundFailure(message: 'p1 missing')),
    );

    bloc.add(AddTrackToPlaylist(playlistId: 'p1', track: track1));
    await Future.delayed(Duration.zero);

    expect(bloc.state.error, isA<NotFoundFailure>());
    expect(bloc.state.isLoading, false);
  });

  test('AddMultipleTrackToPlaylist stops on first failure', () async {
    when(() => usecase.addTrack(playlistId: 'p1', track: track1))
        .thenAnswer((_) async => Result.success(playlist));
    when(() => usecase.addTrack(playlistId: 'p1', track: track2)).thenAnswer(
      (_) async => const Result.failure(UnknownFailure(message: 'kaboom')),
    );

    bloc.add(
      AddMultipleTrackToPlaylist(
        playlistIds: const ['p1'],
        tracks: [track1, track2],
      ),
    );
    await Future.delayed(Duration.zero);

    expect(bloc.state.error, isA<UnknownFailure>());
    verify(() => usecase.addTrack(playlistId: 'p1', track: track1)).called(1);
    verify(() => usecase.addTrack(playlistId: 'p1', track: track2)).called(1);
  });

  test('RemoveTrackFromPlaylist emits lastUpdated on success', () async {
    final updated = playlist.copyWith(tracks: [track2], nbTracks: 1);
    when(() => usecase.removeTrack(playlistId: 'p1', trackId: 't1'))
        .thenAnswer((_) async => Result.success(updated));

    bloc.add(const RemoveTrackFromPlaylist(playlistId: 'p1', trackId: 't1'));
    await Future.delayed(Duration.zero);

    expect(bloc.state.lastUpdated, updated);
  });

  test('RemoveMultipleTrackFromPlaylist iterates over trackIds', () async {
    when(() => usecase.removeTrack(playlistId: 'p1', trackId: 't1'))
        .thenAnswer((_) async => Result.success(playlist));
    when(() => usecase.removeTrack(playlistId: 'p1', trackId: 't2'))
        .thenAnswer((_) async => Result.success(playlist));

    bloc.add(
      const RemoveMultipleTrackFromPlaylist(
        playlistId: 'p1',
        trackIds: ['t1', 't2'],
      ),
    );
    await Future.delayed(Duration.zero);

    expect(bloc.state.error, isNull);
    verify(() => usecase.removeTrack(playlistId: 'p1', trackId: 't1'))
        .called(1);
    verify(() => usecase.removeTrack(playlistId: 'p1', trackId: 't2'))
        .called(1);
  });
}
