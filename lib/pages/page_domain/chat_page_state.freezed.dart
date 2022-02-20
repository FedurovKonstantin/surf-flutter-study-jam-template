// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ChatPageStateTearOff {
  const _$ChatPageStateTearOff();

  _ChatPageState call({bool isProgress = false, bool isFailured = false}) {
    return _ChatPageState(
      isProgress: isProgress,
      isFailured: isFailured,
    );
  }
}

/// @nodoc
const $ChatPageState = _$ChatPageStateTearOff();

/// @nodoc
mixin _$ChatPageState {
  bool get isProgress => throw _privateConstructorUsedError;
  bool get isFailured => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatPageStateCopyWith<ChatPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatPageStateCopyWith<$Res> {
  factory $ChatPageStateCopyWith(
          ChatPageState value, $Res Function(ChatPageState) then) =
      _$ChatPageStateCopyWithImpl<$Res>;
  $Res call({bool isProgress, bool isFailured});
}

/// @nodoc
class _$ChatPageStateCopyWithImpl<$Res>
    implements $ChatPageStateCopyWith<$Res> {
  _$ChatPageStateCopyWithImpl(this._value, this._then);

  final ChatPageState _value;
  // ignore: unused_field
  final $Res Function(ChatPageState) _then;

  @override
  $Res call({
    Object? isProgress = freezed,
    Object? isFailured = freezed,
  }) {
    return _then(_value.copyWith(
      isProgress: isProgress == freezed
          ? _value.isProgress
          : isProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailured: isFailured == freezed
          ? _value.isFailured
          : isFailured // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ChatPageStateCopyWith<$Res>
    implements $ChatPageStateCopyWith<$Res> {
  factory _$ChatPageStateCopyWith(
          _ChatPageState value, $Res Function(_ChatPageState) then) =
      __$ChatPageStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isProgress, bool isFailured});
}

/// @nodoc
class __$ChatPageStateCopyWithImpl<$Res>
    extends _$ChatPageStateCopyWithImpl<$Res>
    implements _$ChatPageStateCopyWith<$Res> {
  __$ChatPageStateCopyWithImpl(
      _ChatPageState _value, $Res Function(_ChatPageState) _then)
      : super(_value, (v) => _then(v as _ChatPageState));

  @override
  _ChatPageState get _value => super._value as _ChatPageState;

  @override
  $Res call({
    Object? isProgress = freezed,
    Object? isFailured = freezed,
  }) {
    return _then(_ChatPageState(
      isProgress: isProgress == freezed
          ? _value.isProgress
          : isProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailured: isFailured == freezed
          ? _value.isFailured
          : isFailured // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ChatPageState implements _ChatPageState {
  _$_ChatPageState({this.isProgress = false, this.isFailured = false});

  @JsonKey()
  @override
  final bool isProgress;
  @JsonKey()
  @override
  final bool isFailured;

  @override
  String toString() {
    return 'ChatPageState(isProgress: $isProgress, isFailured: $isFailured)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatPageState &&
            const DeepCollectionEquality()
                .equals(other.isProgress, isProgress) &&
            const DeepCollectionEquality()
                .equals(other.isFailured, isFailured));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isProgress),
      const DeepCollectionEquality().hash(isFailured));

  @JsonKey(ignore: true)
  @override
  _$ChatPageStateCopyWith<_ChatPageState> get copyWith =>
      __$ChatPageStateCopyWithImpl<_ChatPageState>(this, _$identity);
}

abstract class _ChatPageState implements ChatPageState {
  factory _ChatPageState({bool isProgress, bool isFailured}) = _$_ChatPageState;

  @override
  bool get isProgress;
  @override
  bool get isFailured;
  @override
  @JsonKey(ignore: true)
  _$ChatPageStateCopyWith<_ChatPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
