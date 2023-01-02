// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo2_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Todo2 _$Todo2FromJson(Map<String, dynamic> json) {
  return _Todo2.fromJson(json);
}

/// @nodoc
mixin _$Todo2 {
  String get id => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Todo2CopyWith<Todo2> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Todo2CopyWith<$Res> {
  factory $Todo2CopyWith(Todo2 value, $Res Function(Todo2) then) =
      _$Todo2CopyWithImpl<$Res, Todo2>;
  @useResult
  $Res call(
      {String id,
      String category,
      String text,
      @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class _$Todo2CopyWithImpl<$Res, $Val extends Todo2>
    implements $Todo2CopyWith<$Res> {
  _$Todo2CopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? text = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_Todo2CopyWith<$Res> implements $Todo2CopyWith<$Res> {
  factory _$$_Todo2CopyWith(_$_Todo2 value, $Res Function(_$_Todo2) then) =
      __$$_Todo2CopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String category,
      String text,
      @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class __$$_Todo2CopyWithImpl<$Res> extends _$Todo2CopyWithImpl<$Res, _$_Todo2>
    implements _$$_Todo2CopyWith<$Res> {
  __$$_Todo2CopyWithImpl(_$_Todo2 _value, $Res Function(_$_Todo2) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? text = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$_Todo2(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Todo2 with DiagnosticableTreeMixin implements _Todo2 {
  const _$_Todo2(
      {required this.id,
      required this.category,
      required this.text,
      @TimestampConverter() this.createdAt});

  factory _$_Todo2.fromJson(Map<String, dynamic> json) =>
      _$$_Todo2FromJson(json);

  @override
  final String id;
  @override
  final String category;
  @override
  final String text;
  @override
  @TimestampConverter()
  final DateTime? createdAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Todo2(id: $id, category: $category, text: $text, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Todo2'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('text', text))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Todo2 &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, category, text, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_Todo2CopyWith<_$_Todo2> get copyWith =>
      __$$_Todo2CopyWithImpl<_$_Todo2>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_Todo2ToJson(
      this,
    );
  }
}

abstract class _Todo2 implements Todo2 {
  const factory _Todo2(
      {required final String id,
      required final String category,
      required final String text,
      @TimestampConverter() final DateTime? createdAt}) = _$_Todo2;

  factory _Todo2.fromJson(Map<String, dynamic> json) = _$_Todo2.fromJson;

  @override
  String get id;
  @override
  String get category;
  @override
  String get text;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_Todo2CopyWith<_$_Todo2> get copyWith =>
      throw _privateConstructorUsedError;
}
