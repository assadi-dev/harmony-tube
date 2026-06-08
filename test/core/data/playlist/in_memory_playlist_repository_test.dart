import 'package:flutter_test/flutter_test.dart';
import 'package:harmony_tube/core/data/playlist/in_memory_playlist_repository.dart';
import 'package:harmony_tube/core/errors/failure.dart';
import 'package:harmony_tube/core/models/local_track.dart';
import 'package:harmony_tube/core/models/playlist/local_playlist.dart';

PlaylistItemModel _playlist({
  String id = 'p1',
  String title = 'Mix',
  List<TrackItemModel>? tracks,
}) {
  return PlaylistItemModel(
    id: id,
    title: title,
    tracks: tracks ?? const [],
    nbTracks: tracks?.length ?? 0,
  );
}

TrackItemModel _track({String id = 't1', String title = 'Song'}) {
  return TrackItemModel(id: id, title: title, duration: 1000);
}

void main() {
  late InMemoryPlaylistRepository repository;

  setUp(() {
    repository = InMemoryPlaylistRepository();
  });

  group('PlaylistRepository', () {
    test('all() returns empty list when store is empty', () async {
      final result = await repository.all();

      expect(result.isSuccess, true);
      expect(result.valueOrNull, isEmpty);
    });

    test('save() then all() returns saved playlist', () async {
      final p = _playlist();
      await repository.save(p);

      final result = await repository.all();
      expect(result.valueOrNull, equals([p]));
    });

    test('save() rejects duplicate id with ValidationFailure', () async {
      final p = _playlist();
      await repository.save(p);

      final result = await repository.save(p);
      expect(result.isFailure, true);
      expect(result.failureOrNull, isA<ValidationFailure>());
    });

    test('find() returns NotFoundFailure for unknown id', () async {
      final result = await repository.find(playlistId: 'missing');
      expect(result.isFailure, true);
      expect(result.failureOrNull, isA<NotFoundFailure>());
    });

    test('find() returns the playlist when present', () async {
      final p = _playlist();
      await repository.save(p);

      final result = await repository.find(playlistId: 'p1');
      expect(result.valueOrNull, p);
    });

    test('update() refreshes the stored playlist and bumps updatedAt',
        () async {
      final p = _playlist();
      await repository.save(p);

      final renamed = p.copyWith(title: 'Renamed');
      final result = await repository.update(renamed);

      expect(result.isSuccess, true);
      expect(result.valueOrNull!.title, 'Renamed');
      expect(result.valueOrNull!.updatedAt, isNotNull);
    });

    test('update() returns NotFoundFailure when playlist absent', () async {
      final result = await repository.update(_playlist(id: 'ghost'));
      expect(result.failureOrNull, isA<NotFoundFailure>());
    });

    test('delete() removes the playlist', () async {
      final p = _playlist();
      await repository.save(p);

      final deleted = await repository.delete(playlistId: p.id);
      expect(deleted.isSuccess, true);

      final find = await repository.find(playlistId: p.id);
      expect(find.failureOrNull, isA<NotFoundFailure>());
    });

    test('delete() returns NotFoundFailure when playlist absent', () async {
      final result = await repository.delete(playlistId: 'ghost');
      expect(result.failureOrNull, isA<NotFoundFailure>());
    });

    test('filter() returns sublist matching search and pagination', () async {
      await repository.save(_playlist(id: '1', title: 'Chill Jazz'));
      await repository.save(_playlist(id: '2', title: 'Funk groove'));
      await repository.save(_playlist(id: '3', title: 'Jazz classics'));

      final searched = await repository.filter(search: 'jazz');
      expect(searched.valueOrNull!.length, 2);

      final paged = await repository.filter(limit: 1, page: 1);
      expect(paged.valueOrNull!.length, 1);
    });
  });

  group('PlaylistTrackRepository', () {
    test('addTrack() appends and updates nbTracks', () async {
      final p = _playlist();
      await repository.save(p);

      final result =
          await repository.addTrack(playlistId: p.id, track: _track());
      expect(result.isSuccess, true);
      expect(result.valueOrNull!.tracks.length, 1);
      expect(result.valueOrNull!.nbTracks, 1);
    });

    test('addTrack() returns NotFoundFailure if playlist missing', () async {
      final result =
          await repository.addTrack(playlistId: 'ghost', track: _track());
      expect(result.failureOrNull, isA<NotFoundFailure>());
    });

    test('removeTrack() drops the track and updates nbTracks', () async {
      final p = _playlist(tracks: [_track(id: 't1'), _track(id: 't2')]);
      await repository.save(p);

      final result =
          await repository.removeTrack(playlistId: p.id, trackId: 't1');
      expect(result.isSuccess, true);
      expect(result.valueOrNull!.nbTracks, 1);
      expect(result.valueOrNull!.tracks.first.id, 't2');
    });

    test('getTracks() returns the playlist tracks', () async {
      final p = _playlist(tracks: [_track(id: 't1')]);
      await repository.save(p);

      final result = await repository.getTracks(playlistId: p.id);
      expect(result.valueOrNull!.length, 1);
    });
  });
}
