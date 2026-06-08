// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_track.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TrackItemModel _$TrackItemModelFromJson(Map<String, dynamic> json) {
  return _TrackItemModel.fromJson(json);
}

/// @nodoc
mixin _$TrackItemModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get artist => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  String? get youtubeId => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;
  String? get year => throw _privateConstructorUsedError;
  String? get album => throw _privateConstructorUsedError;
  String? get artwork => throw _privateConstructorUsedError;
  DateTime? get lastPlayedAt => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this TrackItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrackItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrackItemModelCopyWith<TrackItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackItemModelCopyWith<$Res> {
  factory $TrackItemModelCopyWith(
    TrackItemModel value,
    $Res Function(TrackItemModel) then,
  ) = _$TrackItemModelCopyWithImpl<$Res, TrackItemModel>;
  @useResult
  $Res call({
    String id,
    String title,
    String? artist,
    int duration,
    String? youtubeId,
    String? path,
    String? year,
    String? album,
    String? artwork,
    DateTime? lastPlayedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$TrackItemModelCopyWithImpl<$Res, $Val extends TrackItemModel>
    implements $TrackItemModelCopyWith<$Res> {
  _$TrackItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrackItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? artist = freezed,
    Object? duration = null,
    Object? youtubeId = freezed,
    Object? path = freezed,
    Object? year = freezed,
    Object? album = freezed,
    Object? artwork = freezed,
    Object? lastPlayedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            artist: freezed == artist
                ? _value.artist
                : artist // ignore: cast_nullable_to_non_nullable
                      as String?,
            duration: null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as int,
            youtubeId: freezed == youtubeId
                ? _value.youtubeId
                : youtubeId // ignore: cast_nullable_to_non_nullable
                      as String?,
            path: freezed == path
                ? _value.path
                : path // ignore: cast_nullable_to_non_nullable
                      as String?,
            year: freezed == year
                ? _value.year
                : year // ignore: cast_nullable_to_non_nullable
                      as String?,
            album: freezed == album
                ? _value.album
                : album // ignore: cast_nullable_to_non_nullable
                      as String?,
            artwork: freezed == artwork
                ? _value.artwork
                : artwork // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastPlayedAt: freezed == lastPlayedAt
                ? _value.lastPlayedAt
                : lastPlayedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TrackItemModelImplCopyWith<$Res>
    implements $TrackItemModelCopyWith<$Res> {
  factory _$$TrackItemModelImplCopyWith(
    _$TrackItemModelImpl value,
    $Res Function(_$TrackItemModelImpl) then,
  ) = __$$TrackItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String? artist,
    int duration,
    String? youtubeId,
    String? path,
    String? year,
    String? album,
    String? artwork,
    DateTime? lastPlayedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$TrackItemModelImplCopyWithImpl<$Res>
    extends _$TrackItemModelCopyWithImpl<$Res, _$TrackItemModelImpl>
    implements _$$TrackItemModelImplCopyWith<$Res> {
  __$$TrackItemModelImplCopyWithImpl(
    _$TrackItemModelImpl _value,
    $Res Function(_$TrackItemModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TrackItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? artist = freezed,
    Object? duration = null,
    Object? youtubeId = freezed,
    Object? path = freezed,
    Object? year = freezed,
    Object? album = freezed,
    Object? artwork = freezed,
    Object? lastPlayedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$TrackItemModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        artist: freezed == artist
            ? _value.artist
            : artist // ignore: cast_nullable_to_non_nullable
                  as String?,
        duration: null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as int,
        youtubeId: freezed == youtubeId
            ? _value.youtubeId
            : youtubeId // ignore: cast_nullable_to_non_nullable
                  as String?,
        path: freezed == path
            ? _value.path
            : path // ignore: cast_nullable_to_non_nullable
                  as String?,
        year: freezed == year
            ? _value.year
            : year // ignore: cast_nullable_to_non_nullable
                  as String?,
        album: freezed == album
            ? _value.album
            : album // ignore: cast_nullable_to_non_nullable
                  as String?,
        artwork: freezed == artwork
            ? _value.artwork
            : artwork // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastPlayedAt: freezed == lastPlayedAt
            ? _value.lastPlayedAt
            : lastPlayedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TrackItemModelImpl implements _TrackItemModel {
  const _$TrackItemModelImpl({
    required this.id,
    required this.title,
    this.artist = 'unknown',
    required this.duration,
    this.youtubeId,
    this.path,
    this.year,
    this.album,
    this.artwork,
    this.lastPlayedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory _$TrackItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackItemModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  @JsonKey()
  final String? artist;
  @override
  final int duration;
  @override
  final String? youtubeId;
  @override
  final String? path;
  @override
  final String? year;
  @override
  final String? album;
  @override
  final String? artwork;
  @override
  final DateTime? lastPlayedAt;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'TrackItemModel(id: $id, title: $title, artist: $artist, duration: $duration, youtubeId: $youtubeId, path: $path, year: $year, album: $album, artwork: $artwork, lastPlayedAt: $lastPlayedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.youtubeId, youtubeId) ||
                other.youtubeId == youtubeId) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.album, album) || other.album == album) &&
            (identical(other.artwork, artwork) || other.artwork == artwork) &&
            (identical(other.lastPlayedAt, lastPlayedAt) ||
                other.lastPlayedAt == lastPlayedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    artist,
    duration,
    youtubeId,
    path,
    year,
    album,
    artwork,
    lastPlayedAt,
    createdAt,
    updatedAt,
  );

  /// Create a copy of TrackItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackItemModelImplCopyWith<_$TrackItemModelImpl> get copyWith =>
      __$$TrackItemModelImplCopyWithImpl<_$TrackItemModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackItemModelImplToJson(this);
  }
}

abstract class _TrackItemModel implements TrackItemModel {
  const factory _TrackItemModel({
    required final String id,
    required final String title,
    final String? artist,
    required final int duration,
    final String? youtubeId,
    final String? path,
    final String? year,
    final String? album,
    final String? artwork,
    final DateTime? lastPlayedAt,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$TrackItemModelImpl;

  factory _TrackItemModel.fromJson(Map<String, dynamic> json) =
      _$TrackItemModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get artist;
  @override
  int get duration;
  @override
  String? get youtubeId;
  @override
  String? get path;
  @override
  String? get year;
  @override
  String? get album;
  @override
  String? get artwork;
  @override
  DateTime? get lastPlayedAt;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of TrackItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrackItemModelImplCopyWith<_$TrackItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
