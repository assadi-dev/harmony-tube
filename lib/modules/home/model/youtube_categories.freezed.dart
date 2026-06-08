// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'youtube_categories.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

YoutubeCategory _$YoutubeCategoryFromJson(Map<String, dynamic> json) {
  return _YoutubeCategory.fromJson(json);
}

/// @nodoc
mixin _$YoutubeCategory {
  String get title => throw _privateConstructorUsedError;
  String get params => throw _privateConstructorUsedError;

  /// Serializes this YoutubeCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of YoutubeCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $YoutubeCategoryCopyWith<YoutubeCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YoutubeCategoryCopyWith<$Res> {
  factory $YoutubeCategoryCopyWith(
    YoutubeCategory value,
    $Res Function(YoutubeCategory) then,
  ) = _$YoutubeCategoryCopyWithImpl<$Res, YoutubeCategory>;
  @useResult
  $Res call({String title, String params});
}

/// @nodoc
class _$YoutubeCategoryCopyWithImpl<$Res, $Val extends YoutubeCategory>
    implements $YoutubeCategoryCopyWith<$Res> {
  _$YoutubeCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of YoutubeCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? title = null, Object? params = null}) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            params: null == params
                ? _value.params
                : params // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$YoutubeCategoryImplCopyWith<$Res>
    implements $YoutubeCategoryCopyWith<$Res> {
  factory _$$YoutubeCategoryImplCopyWith(
    _$YoutubeCategoryImpl value,
    $Res Function(_$YoutubeCategoryImpl) then,
  ) = __$$YoutubeCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String params});
}

/// @nodoc
class __$$YoutubeCategoryImplCopyWithImpl<$Res>
    extends _$YoutubeCategoryCopyWithImpl<$Res, _$YoutubeCategoryImpl>
    implements _$$YoutubeCategoryImplCopyWith<$Res> {
  __$$YoutubeCategoryImplCopyWithImpl(
    _$YoutubeCategoryImpl _value,
    $Res Function(_$YoutubeCategoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of YoutubeCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? title = null, Object? params = null}) {
    return _then(
      _$YoutubeCategoryImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        params: null == params
            ? _value.params
            : params // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$YoutubeCategoryImpl implements _YoutubeCategory {
  const _$YoutubeCategoryImpl({required this.title, required this.params});

  factory _$YoutubeCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$YoutubeCategoryImplFromJson(json);

  @override
  final String title;
  @override
  final String params;

  @override
  String toString() {
    return 'YoutubeCategory(title: $title, params: $params)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YoutubeCategoryImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.params, params) || other.params == params));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, params);

  /// Create a copy of YoutubeCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$YoutubeCategoryImplCopyWith<_$YoutubeCategoryImpl> get copyWith =>
      __$$YoutubeCategoryImplCopyWithImpl<_$YoutubeCategoryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$YoutubeCategoryImplToJson(this);
  }
}

abstract class _YoutubeCategory implements YoutubeCategory {
  const factory _YoutubeCategory({
    required final String title,
    required final String params,
  }) = _$YoutubeCategoryImpl;

  factory _YoutubeCategory.fromJson(Map<String, dynamic> json) =
      _$YoutubeCategoryImpl.fromJson;

  @override
  String get title;
  @override
  String get params;

  /// Create a copy of YoutubeCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$YoutubeCategoryImplCopyWith<_$YoutubeCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
