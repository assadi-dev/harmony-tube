// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_playlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PlaylistItemModel _$PlaylistItemModelFromJson(Map<String, dynamic> json) {
  return _PlaylistItemModel.fromJson(json);
}

/// @nodoc
mixin _$PlaylistItemModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get cover => throw _privateConstructorUsedError;
  List<TrackItemModel> get tracks => throw _privateConstructorUsedError;
  int get nbTracks => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime? get lastPlayedAt => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PlaylistItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlaylistItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaylistItemModelCopyWith<PlaylistItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistItemModelCopyWith<$Res> {
  factory $PlaylistItemModelCopyWith(
    PlaylistItemModel value,
    $Res Function(PlaylistItemModel) then,
  ) = _$PlaylistItemModelCopyWithImpl<$Res, PlaylistItemModel>;
  @useResult
  $Res call({
    String id,
    String title,
    String? cover,
    List<TrackItemModel> tracks,
    int nbTracks,
    String? description,
    DateTime? lastPlayedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$PlaylistItemModelCopyWithImpl<$Res, $Val extends PlaylistItemModel>
    implements $PlaylistItemModelCopyWith<$Res> {
  _$PlaylistItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaylistItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? cover = freezed,
    Object? tracks = null,
    Object? nbTracks = null,
    Object? description = freezed,
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
            cover: freezed == cover
                ? _value.cover
                : cover // ignore: cast_nullable_to_non_nullable
                      as String?,
            tracks: null == tracks
                ? _value.tracks
                : tracks // ignore: cast_nullable_to_non_nullable
                      as List<TrackItemModel>,
            nbTracks: null == nbTracks
                ? _value.nbTracks
                : nbTracks // ignore: cast_nullable_to_non_nullable
                      as int,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
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
abstract class _$$PlaylistItemModelImplCopyWith<$Res>
    implements $PlaylistItemModelCopyWith<$Res> {
  factory _$$PlaylistItemModelImplCopyWith(
    _$PlaylistItemModelImpl value,
    $Res Function(_$PlaylistItemModelImpl) then,
  ) = __$$PlaylistItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String? cover,
    List<TrackItemModel> tracks,
    int nbTracks,
    String? description,
    DateTime? lastPlayedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$PlaylistItemModelImplCopyWithImpl<$Res>
    extends _$PlaylistItemModelCopyWithImpl<$Res, _$PlaylistItemModelImpl>
    implements _$$PlaylistItemModelImplCopyWith<$Res> {
  __$$PlaylistItemModelImplCopyWithImpl(
    _$PlaylistItemModelImpl _value,
    $Res Function(_$PlaylistItemModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlaylistItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? cover = freezed,
    Object? tracks = null,
    Object? nbTracks = null,
    Object? description = freezed,
    Object? lastPlayedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$PlaylistItemModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        cover: freezed == cover
            ? _value.cover
            : cover // ignore: cast_nullable_to_non_nullable
                  as String?,
        tracks: null == tracks
            ? _value._tracks
            : tracks // ignore: cast_nullable_to_non_nullable
                  as List<TrackItemModel>,
        nbTracks: null == nbTracks
            ? _value.nbTracks
            : nbTracks // ignore: cast_nullable_to_non_nullable
                  as int,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
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
class _$PlaylistItemModelImpl implements _PlaylistItemModel {
  const _$PlaylistItemModelImpl({
    required this.id,
    required this.title,
    this.cover,
    final List<TrackItemModel> tracks = const <TrackItemModel>[],
    this.nbTracks = 0,
    this.description,
    this.lastPlayedAt,
    this.createdAt,
    this.updatedAt,
  }) : _tracks = tracks;

  factory _$PlaylistItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaylistItemModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? cover;
  final List<TrackItemModel> _tracks;
  @override
  @JsonKey()
  List<TrackItemModel> get tracks {
    if (_tracks is EqualUnmodifiableListView) return _tracks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tracks);
  }

  @override
  @JsonKey()
  final int nbTracks;
  @override
  final String? description;
  @override
  final DateTime? lastPlayedAt;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'PlaylistItemModel(id: $id, title: $title, cover: $cover, tracks: $tracks, nbTracks: $nbTracks, description: $description, lastPlayedAt: $lastPlayedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaylistItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.cover, cover) || other.cover == cover) &&
            const DeepCollectionEquality().equals(other._tracks, _tracks) &&
            (identical(other.nbTracks, nbTracks) ||
                other.nbTracks == nbTracks) &&
            (identical(other.description, description) ||
                other.description == description) &&
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
    cover,
    const DeepCollectionEquality().hash(_tracks),
    nbTracks,
    description,
    lastPlayedAt,
    createdAt,
    updatedAt,
  );

  /// Create a copy of PlaylistItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaylistItemModelImplCopyWith<_$PlaylistItemModelImpl> get copyWith =>
      __$$PlaylistItemModelImplCopyWithImpl<_$PlaylistItemModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaylistItemModelImplToJson(this);
  }
}

abstract class _PlaylistItemModel implements PlaylistItemModel {
  const factory _PlaylistItemModel({
    required final String id,
    required final String title,
    final String? cover,
    final List<TrackItemModel> tracks,
    final int nbTracks,
    final String? description,
    final DateTime? lastPlayedAt,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$PlaylistItemModelImpl;

  factory _PlaylistItemModel.fromJson(Map<String, dynamic> json) =
      _$PlaylistItemModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get cover;
  @override
  List<TrackItemModel> get tracks;
  @override
  int get nbTracks;
  @override
  String? get description;
  @override
  DateTime? get lastPlayedAt;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of PlaylistItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaylistItemModelImplCopyWith<_$PlaylistItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
