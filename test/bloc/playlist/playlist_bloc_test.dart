import 'package:flutter_test/flutter_test.dart';
import 'package:harmony_tube/bloc/playlist/playlist_bloc.dart';
import 'package:harmony_tube/bloc/playlist/playlist_event.dart';
import 'package:harmony_tube/bloc/playlist/playlist_state.dart';
import 'package:harmony_tube/core/errors/failure.dart';
import 'package:harmony_tube/core/errors/result.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist_usecase.dart';
import 'package:mocktail/mocktail.dart';

class _MockPlaylistUsecase extends Mock implements PlaylistUsecase {}

void main() {
  late _MockPlaylistUsecase usecase;
  late PlaylistBloc bloc;

  final p1 = PlaylistItemModel(id: 'p1', title: 'Mix');
  final p2 = PlaylistItemModel(id: 'p2', title: 'Lounge');

  setUpAll(() {
    registerFallbackValue(p1);
  });

  setUp(() {
    usecase = _MockPlaylistUsecase();
    bloc = PlaylistBloc(playlistUsecase: usecase);
  });

  tearDown(() => bloc.close());

  test('initial state has empty collections and no error', () {
    expect(bloc.state.collections, isEmpty);
    expect(bloc.state.error, isNull);
    expect(bloc.state.isLoading, isFalse);
  });

  test('GetPlaylistCollections emits loading then collections on success',
      () async {
    when(usecase.getPlaylistItems)
        .thenAnswer((_) async => Result.success([p1, p2]));

    final states = <PlaylistState>[];
    final sub = bloc.stream.listen(states.add);

    bloc.add(const GetPlaylistCollections());
    await Future.delayed(Duration.zero);

    expect(states.first.isLoading, true);
    expect(states.last.collections, [p1, p2]);
    expect(states.last.error, isNull);

    await sub.cancel();
  });

  test('GetPlaylistCollections emits Failure when usecase returns failure',
      () async {
    when(usecase.getPlaylistItems).thenAnswer(
      (_) async => const Result.failure(
        NetworkFailure(message: 'offline'),
      ),
    );

    final states = <PlaylistState>[];
    final sub = bloc.stream.listen(states.add);

    bloc.add(const GetPlaylistCollections());
    await Future.delayed(Duration.zero);

    expect(states.last.error, isA<NetworkFailure>());
    expect(states.last.isLoading, false);

    await sub.cancel();
  });

  test('CreatePlaylist appends to collections on success', () async {
    when(() => usecase.createPlaylist(p1))
        .thenAnswer((_) async => const Result.success(null));

    final states = <PlaylistState>[];
    final sub = bloc.stream.listen(states.add);

    bloc.add(CreatePlaylist(p1));
    await Future.delayed(Duration.zero);

    expect(states.last.collections, [p1]);
    expect(states.last.error, isNull);

    await sub.cancel();
  });

  test('DeletePlaylist removes the playlist from collections', () async {
    when(usecase.getPlaylistItems)
        .thenAnswer((_) async => Result.success([p1, p2]));
    when(() => usecase.deletePlaylist('p1'))
        .thenAnswer((_) async => const Result.success(null));

    bloc.add(const GetPlaylistCollections());
    await Future.delayed(Duration.zero);

    bloc.add(const DeletePlaylist(playlistId: 'p1'));
    await Future.delayed(Duration.zero);

    expect(bloc.state.collections, [p2]);
  });

  test('UpdatePlaylist replaces the playlist in collections', () async {
    when(usecase.getPlaylistItems)
        .thenAnswer((_) async => Result.success([p1, p2]));

    final renamed = p1.copyWith(title: 'Renamed');
    when(() => usecase.updatePlaylist(renamed))
        .thenAnswer((_) async => Result.success(renamed));

    bloc.add(const GetPlaylistCollections());
    await Future.delayed(Duration.zero);

    bloc.add(UpdatePlaylist(playlist: renamed));
    await Future.delayed(Duration.zero);

    expect(bloc.state.collections.first.title, 'Renamed');
    expect(bloc.state.playlist, renamed);
  });

  test('FindPlaylist sets state.playlist when found', () async {
    when(() => usecase.findPlaylist('p1'))
        .thenAnswer((_) async => Result.success(p1));

    bloc.add(const FindPlaylist(playlistId: 'p1'));
    await Future.delayed(Duration.zero);

    expect(bloc.state.playlist, p1);
    expect(bloc.state.error, isNull);
  });

  test('FindPlaylist emits Failure when not found', () async {
    when(() => usecase.findPlaylist('ghost')).thenAnswer(
      (_) async => const Result.failure(
        NotFoundFailure(message: 'ghost missing'),
      ),
    );

    bloc.add(const FindPlaylist(playlistId: 'ghost'));
    await Future.delayed(Duration.zero);

    expect(bloc.state.error, isA<NotFoundFailure>());
  });

  test('ClearPlaylist resets state.playlist', () async {
    when(() => usecase.findPlaylist('p1'))
        .thenAnswer((_) async => Result.success(p1));

    bloc.add(const FindPlaylist(playlistId: 'p1'));
    await Future.delayed(Duration.zero);
    expect(bloc.state.playlist, p1);

    bloc.add(const ClearPlaylist());
    await Future.delayed(Duration.zero);

    expect(bloc.state.playlist, isNull);
  });
}
