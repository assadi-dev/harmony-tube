// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'youtube_playlist_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

YoutubePlaylistModel _$YoutubePlaylistModelFromJson(Map<String, dynamic> json) {
  return _YoutubePlaylistModel.fromJson(json);
}

/// @nodoc
mixin _$YoutubePlaylistModel {
  String get title => throw _privateConstructorUsedError;
  String get playlistId => throw _privateConstructorUsedError;
  List<YoutubeThumbnail> get thumbnails => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get contents => throw _privateConstructorUsedError;

  /// Serializes this YoutubePlaylistModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of YoutubePlaylistModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $YoutubePlaylistModelCopyWith<YoutubePlaylistModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YoutubePlaylistModelCopyWith<$Res> {
  factory $YoutubePlaylistModelCopyWith(
    YoutubePlaylistModel value,
    $Res Function(YoutubePlaylistModel) then,
  ) = _$YoutubePlaylistModelCopyWithImpl<$Res, YoutubePlaylistModel>;
  @useResult
  $Res call({
    String title,
    String playlistId,
    List<YoutubeThumbnail> thumbnails,
    String description,
    List<String> contents,
  });
}

/// @nodoc
class _$YoutubePlaylistModelCopyWithImpl<
  $Res,
  $Val extends YoutubePlaylistModel
>
    implements $YoutubePlaylistModelCopyWith<$Res> {
  _$YoutubePlaylistModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of YoutubePlaylistModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? playlistId = null,
    Object? thumbnails = null,
    Object? description = null,
    Object? contents = null,
  }) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            playlistId: null == playlistId
                ? _value.playlistId
                : playlistId // ignore: cast_nullable_to_non_nullable
                      as String,
            thumbnails: null == thumbnails
                ? _value.thumbnails
                : thumbnails // ignore: cast_nullable_to_non_nullable
                      as List<YoutubeThumbnail>,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            contents: null == contents
                ? _value.contents
                : contents // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$YoutubePlaylistModelImplCopyWith<$Res>
    implements $YoutubePlaylistModelCopyWith<$Res> {
  factory _$$YoutubePlaylistModelImplCopyWith(
    _$YoutubePlaylistModelImpl value,
    $Res Function(_$YoutubePlaylistModelImpl) then,
  ) = __$$YoutubePlaylistModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    String playlistId,
    List<YoutubeThumbnail> thumbnails,
    String description,
    List<String> contents,
  });
}

/// @nodoc
class __$$YoutubePlaylistModelImplCopyWithImpl<$Res>
    extends _$YoutubePlaylistModelCopyWithImpl<$Res, _$YoutubePlaylistModelImpl>
    implements _$$YoutubePlaylistModelImplCopyWith<$Res> {
  __$$YoutubePlaylistModelImplCopyWithImpl(
    _$YoutubePlaylistModelImpl _value,
    $Res Function(_$YoutubePlaylistModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of YoutubePlaylistModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? playlistId = null,
    Object? thumbnails = null,
    Object? description = null,
    Object? contents = null,
  }) {
    return _then(
      _$YoutubePlaylistModelImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        playlistId: null == playlistId
            ? _value.playlistId
            : playlistId // ignore: cast_nullable_to_non_nullable
                  as String,
        thumbnails: null == thumbnails
            ? _value._thumbnails
            : thumbnails // ignore: cast_nullable_to_non_nullable
                  as List<YoutubeThumbnail>,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        contents: null == contents
            ? _value._contents
            : contents // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$YoutubePlaylistModelImpl implements _YoutubePlaylistModel {
  const _$YoutubePlaylistModelImpl({
    required this.title,
    required this.playlistId,
    required final List<YoutubeThumbnail> thumbnails,
    required this.description,
    required final List<String> contents,
  }) : _thumbnails = thumbnails,
       _contents = contents;

  factory _$YoutubePlaylistModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$YoutubePlaylistModelImplFromJson(json);

  @override
  final String title;
  @override
  final String playlistId;
  final List<YoutubeThumbnail> _thumbnails;
  @override
  List<YoutubeThumbnail> get thumbnails {
    if (_thumbnails is EqualUnmodifiableListView) return _thumbnails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_thumbnails);
  }

  @override
  final String description;
  final List<String> _contents;
  @override
  List<String> get contents {
    if (_contents is EqualUnmodifiableListView) return _contents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contents);
  }

  @override
  String toString() {
    return 'YoutubePlaylistModel(title: $title, playlistId: $playlistId, thumbnails: $thumbnails, description: $description, contents: $contents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YoutubePlaylistModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.playlistId, playlistId) ||
                other.playlistId == playlistId) &&
            const DeepCollectionEquality().equals(
              other._thumbnails,
              _thumbnails,
            ) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._contents, _contents));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    playlistId,
    const DeepCollectionEquality().hash(_thumbnails),
    description,
    const DeepCollectionEquality().hash(_contents),
  );

  /// Create a copy of YoutubePlaylistModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$YoutubePlaylistModelImplCopyWith<_$YoutubePlaylistModelImpl>
  get copyWith =>
      __$$YoutubePlaylistModelImplCopyWithImpl<_$YoutubePlaylistModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$YoutubePlaylistModelImplToJson(this);
  }
}

abstract class _YoutubePlaylistModel implements YoutubePlaylistModel {
  const factory _YoutubePlaylistModel({
    required final String title,
    required final String playlistId,
    required final List<YoutubeThumbnail> thumbnails,
    required final String description,
    required final List<String> contents,
  }) = _$YoutubePlaylistModelImpl;

  factory _YoutubePlaylistModel.fromJson(Map<String, dynamic> json) =
      _$YoutubePlaylistModelImpl.fromJson;

  @override
  String get title;
  @override
  String get playlistId;
  @override
  List<YoutubeThumbnail> get thumbnails;
  @override
  String get description;
  @override
  List<String> get contents;

  /// Create a copy of YoutubePlaylistModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$YoutubePlaylistModelImplCopyWith<_$YoutubePlaylistModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

YoutubeThumbnail _$YoutubeThumbnailFromJson(Map<String, dynamic> json) {
  return _YoutubeThumbnail.fromJson(json);
}

/// @nodoc
mixin _$YoutubeThumbnail {
  String get url => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;

  /// Serializes this YoutubeThumbnail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of YoutubeThumbnail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $YoutubeThumbnailCopyWith<YoutubeThumbnail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YoutubeThumbnailCopyWith<$Res> {
  factory $YoutubeThumbnailCopyWith(
    YoutubeThumbnail value,
    $Res Function(YoutubeThumbnail) then,
  ) = _$YoutubeThumbnailCopyWithImpl<$Res, YoutubeThumbnail>;
  @useResult
  $Res call({String url, int width, int height});
}

/// @nodoc
class _$YoutubeThumbnailCopyWithImpl<$Res, $Val extends YoutubeThumbnail>
    implements $YoutubeThumbnailCopyWith<$Res> {
  _$YoutubeThumbnailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of YoutubeThumbnail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? url = null, Object? width = null, Object? height = null}) {
    return _then(
      _value.copyWith(
            url: null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String,
            width: null == width
                ? _value.width
                : width // ignore: cast_nullable_to_non_nullable
                      as int,
            height: null == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$YoutubeThumbnailImplCopyWith<$Res>
    implements $YoutubeThumbnailCopyWith<$Res> {
  factory _$$YoutubeThumbnailImplCopyWith(
    _$YoutubeThumbnailImpl value,
    $Res Function(_$YoutubeThumbnailImpl) then,
  ) = __$$YoutubeThumbnailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url, int width, int height});
}

/// @nodoc
class __$$YoutubeThumbnailImplCopyWithImpl<$Res>
    extends _$YoutubeThumbnailCopyWithImpl<$Res, _$YoutubeThumbnailImpl>
    implements _$$YoutubeThumbnailImplCopyWith<$Res> {
  __$$YoutubeThumbnailImplCopyWithImpl(
    _$YoutubeThumbnailImpl _value,
    $Res Function(_$YoutubeThumbnailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of YoutubeThumbnail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? url = null, Object? width = null, Object? height = null}) {
    return _then(
      _$YoutubeThumbnailImpl(
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
        width: null == width
            ? _value.width
            : width // ignore: cast_nullable_to_non_nullable
                  as int,
        height: null == height
            ? _value.height
            : height // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$YoutubeThumbnailImpl implements _YoutubeThumbnail {
  const _$YoutubeThumbnailImpl({
    required this.url,
    required this.width,
    required this.height,
  });

  factory _$YoutubeThumbnailImpl.fromJson(Map<String, dynamic> json) =>
      _$$YoutubeThumbnailImplFromJson(json);

  @override
  final String url;
  @override
  final int width;
  @override
  final int height;

  @override
  String toString() {
    return 'YoutubeThumbnail(url: $url, width: $width, height: $height)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YoutubeThumbnailImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, width, height);

  /// Create a copy of YoutubeThumbnail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$YoutubeThumbnailImplCopyWith<_$YoutubeThumbnailImpl> get copyWith =>
      __$$YoutubeThumbnailImplCopyWithImpl<_$YoutubeThumbnailImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$YoutubeThumbnailImplToJson(this);
  }
}

abstract class _YoutubeThumbnail implements YoutubeThumbnail {
  const factory _YoutubeThumbnail({
    required final String url,
    required final int width,
    required final int height,
  }) = _$YoutubeThumbnailImpl;

  factory _YoutubeThumbnail.fromJson(Map<String, dynamic> json) =
      _$YoutubeThumbnailImpl.fromJson;

  @override
  String get url;
  @override
  int get width;
  @override
  int get height;

  /// Create a copy of YoutubeThumbnail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$YoutubeThumbnailImplCopyWith<_$YoutubeThumbnailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
