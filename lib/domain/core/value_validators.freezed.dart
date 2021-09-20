// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'value_validators.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ValueFailureTearOff {
  const _$ValueFailureTearOff();

  _InvalidEmail<T> invalidEmail<T>(T failedVal) {
    return _InvalidEmail<T>(
      failedVal,
    );
  }

  _ShortPassword<T> shortPassword<T>(T failedVal) {
    return _ShortPassword<T>(
      failedVal,
    );
  }

  _Empty<T> empty<T>(T failedVal) {
    return _Empty<T>(
      failedVal,
    );
  }

  _ExceededLength<T> exceededLength<T>(T failedVal, int maxLength) {
    return _ExceededLength<T>(
      failedVal,
      maxLength,
    );
  }
}

/// @nodoc
const $ValueFailure = _$ValueFailureTearOff();

/// @nodoc
mixin _$ValueFailure<T> {
  T get failedVal => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedVal) invalidEmail,
    required TResult Function(T failedVal) shortPassword,
    required TResult Function(T failedVal) empty,
    required TResult Function(T failedVal, int maxLength) exceededLength,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T failedVal)? invalidEmail,
    TResult Function(T failedVal)? shortPassword,
    TResult Function(T failedVal)? empty,
    TResult Function(T failedVal, int maxLength)? exceededLength,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedVal)? invalidEmail,
    TResult Function(T failedVal)? shortPassword,
    TResult Function(T failedVal)? empty,
    TResult Function(T failedVal, int maxLength)? exceededLength,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidEmail<T> value) invalidEmail,
    required TResult Function(_ShortPassword<T> value) shortPassword,
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_ExceededLength<T> value) exceededLength,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InvalidEmail<T> value)? invalidEmail,
    TResult Function(_ShortPassword<T> value)? shortPassword,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_ExceededLength<T> value)? exceededLength,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidEmail<T> value)? invalidEmail,
    TResult Function(_ShortPassword<T> value)? shortPassword,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_ExceededLength<T> value)? exceededLength,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ValueFailureCopyWith<T, ValueFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueFailureCopyWith<T, $Res> {
  factory $ValueFailureCopyWith(
          ValueFailure<T> value, $Res Function(ValueFailure<T>) then) =
      _$ValueFailureCopyWithImpl<T, $Res>;
  $Res call({T failedVal});
}

/// @nodoc
class _$ValueFailureCopyWithImpl<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  _$ValueFailureCopyWithImpl(this._value, this._then);

  final ValueFailure<T> _value;
  // ignore: unused_field
  final $Res Function(ValueFailure<T>) _then;

  @override
  $Res call({
    Object? failedVal = freezed,
  }) {
    return _then(_value.copyWith(
      failedVal: failedVal == freezed
          ? _value.failedVal
          : failedVal // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
abstract class _$InvalidEmailCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$InvalidEmailCopyWith(
          _InvalidEmail<T> value, $Res Function(_InvalidEmail<T>) then) =
      __$InvalidEmailCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedVal});
}

/// @nodoc
class __$InvalidEmailCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements _$InvalidEmailCopyWith<T, $Res> {
  __$InvalidEmailCopyWithImpl(
      _InvalidEmail<T> _value, $Res Function(_InvalidEmail<T>) _then)
      : super(_value, (v) => _then(v as _InvalidEmail<T>));

  @override
  _InvalidEmail<T> get _value => super._value as _InvalidEmail<T>;

  @override
  $Res call({
    Object? failedVal = freezed,
  }) {
    return _then(_InvalidEmail<T>(
      failedVal == freezed
          ? _value.failedVal
          : failedVal // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$_InvalidEmail<T> extends _InvalidEmail<T> {
  const _$_InvalidEmail(this.failedVal) : super._();

  @override
  final T failedVal;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidEmail(failedVal: $failedVal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _InvalidEmail<T> &&
            (identical(other.failedVal, failedVal) ||
                const DeepCollectionEquality()
                    .equals(other.failedVal, failedVal)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedVal);

  @JsonKey(ignore: true)
  @override
  _$InvalidEmailCopyWith<T, _InvalidEmail<T>> get copyWith =>
      __$InvalidEmailCopyWithImpl<T, _InvalidEmail<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedVal) invalidEmail,
    required TResult Function(T failedVal) shortPassword,
    required TResult Function(T failedVal) empty,
    required TResult Function(T failedVal, int maxLength) exceededLength,
  }) {
    return invalidEmail(failedVal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T failedVal)? invalidEmail,
    TResult Function(T failedVal)? shortPassword,
    TResult Function(T failedVal)? empty,
    TResult Function(T failedVal, int maxLength)? exceededLength,
  }) {
    return invalidEmail?.call(failedVal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedVal)? invalidEmail,
    TResult Function(T failedVal)? shortPassword,
    TResult Function(T failedVal)? empty,
    TResult Function(T failedVal, int maxLength)? exceededLength,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(failedVal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidEmail<T> value) invalidEmail,
    required TResult Function(_ShortPassword<T> value) shortPassword,
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_ExceededLength<T> value) exceededLength,
  }) {
    return invalidEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InvalidEmail<T> value)? invalidEmail,
    TResult Function(_ShortPassword<T> value)? shortPassword,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_ExceededLength<T> value)? exceededLength,
  }) {
    return invalidEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidEmail<T> value)? invalidEmail,
    TResult Function(_ShortPassword<T> value)? shortPassword,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_ExceededLength<T> value)? exceededLength,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(this);
    }
    return orElse();
  }
}

abstract class _InvalidEmail<T> extends ValueFailure<T> {
  const factory _InvalidEmail(T failedVal) = _$_InvalidEmail<T>;
  const _InvalidEmail._() : super._();

  @override
  T get failedVal => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$InvalidEmailCopyWith<T, _InvalidEmail<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ShortPasswordCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$ShortPasswordCopyWith(
          _ShortPassword<T> value, $Res Function(_ShortPassword<T>) then) =
      __$ShortPasswordCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedVal});
}

/// @nodoc
class __$ShortPasswordCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements _$ShortPasswordCopyWith<T, $Res> {
  __$ShortPasswordCopyWithImpl(
      _ShortPassword<T> _value, $Res Function(_ShortPassword<T>) _then)
      : super(_value, (v) => _then(v as _ShortPassword<T>));

  @override
  _ShortPassword<T> get _value => super._value as _ShortPassword<T>;

  @override
  $Res call({
    Object? failedVal = freezed,
  }) {
    return _then(_ShortPassword<T>(
      failedVal == freezed
          ? _value.failedVal
          : failedVal // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$_ShortPassword<T> extends _ShortPassword<T> {
  const _$_ShortPassword(this.failedVal) : super._();

  @override
  final T failedVal;

  @override
  String toString() {
    return 'ValueFailure<$T>.shortPassword(failedVal: $failedVal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ShortPassword<T> &&
            (identical(other.failedVal, failedVal) ||
                const DeepCollectionEquality()
                    .equals(other.failedVal, failedVal)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedVal);

  @JsonKey(ignore: true)
  @override
  _$ShortPasswordCopyWith<T, _ShortPassword<T>> get copyWith =>
      __$ShortPasswordCopyWithImpl<T, _ShortPassword<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedVal) invalidEmail,
    required TResult Function(T failedVal) shortPassword,
    required TResult Function(T failedVal) empty,
    required TResult Function(T failedVal, int maxLength) exceededLength,
  }) {
    return shortPassword(failedVal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T failedVal)? invalidEmail,
    TResult Function(T failedVal)? shortPassword,
    TResult Function(T failedVal)? empty,
    TResult Function(T failedVal, int maxLength)? exceededLength,
  }) {
    return shortPassword?.call(failedVal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedVal)? invalidEmail,
    TResult Function(T failedVal)? shortPassword,
    TResult Function(T failedVal)? empty,
    TResult Function(T failedVal, int maxLength)? exceededLength,
    required TResult orElse(),
  }) {
    if (shortPassword != null) {
      return shortPassword(failedVal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidEmail<T> value) invalidEmail,
    required TResult Function(_ShortPassword<T> value) shortPassword,
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_ExceededLength<T> value) exceededLength,
  }) {
    return shortPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InvalidEmail<T> value)? invalidEmail,
    TResult Function(_ShortPassword<T> value)? shortPassword,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_ExceededLength<T> value)? exceededLength,
  }) {
    return shortPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidEmail<T> value)? invalidEmail,
    TResult Function(_ShortPassword<T> value)? shortPassword,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_ExceededLength<T> value)? exceededLength,
    required TResult orElse(),
  }) {
    if (shortPassword != null) {
      return shortPassword(this);
    }
    return orElse();
  }
}

abstract class _ShortPassword<T> extends ValueFailure<T> {
  const factory _ShortPassword(T failedVal) = _$_ShortPassword<T>;
  const _ShortPassword._() : super._();

  @override
  T get failedVal => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ShortPasswordCopyWith<T, _ShortPassword<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$EmptyCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$EmptyCopyWith(_Empty<T> value, $Res Function(_Empty<T>) then) =
      __$EmptyCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedVal});
}

/// @nodoc
class __$EmptyCopyWithImpl<T, $Res> extends _$ValueFailureCopyWithImpl<T, $Res>
    implements _$EmptyCopyWith<T, $Res> {
  __$EmptyCopyWithImpl(_Empty<T> _value, $Res Function(_Empty<T>) _then)
      : super(_value, (v) => _then(v as _Empty<T>));

  @override
  _Empty<T> get _value => super._value as _Empty<T>;

  @override
  $Res call({
    Object? failedVal = freezed,
  }) {
    return _then(_Empty<T>(
      failedVal == freezed
          ? _value.failedVal
          : failedVal // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$_Empty<T> extends _Empty<T> {
  const _$_Empty(this.failedVal) : super._();

  @override
  final T failedVal;

  @override
  String toString() {
    return 'ValueFailure<$T>.empty(failedVal: $failedVal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Empty<T> &&
            (identical(other.failedVal, failedVal) ||
                const DeepCollectionEquality()
                    .equals(other.failedVal, failedVal)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedVal);

  @JsonKey(ignore: true)
  @override
  _$EmptyCopyWith<T, _Empty<T>> get copyWith =>
      __$EmptyCopyWithImpl<T, _Empty<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedVal) invalidEmail,
    required TResult Function(T failedVal) shortPassword,
    required TResult Function(T failedVal) empty,
    required TResult Function(T failedVal, int maxLength) exceededLength,
  }) {
    return empty(failedVal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T failedVal)? invalidEmail,
    TResult Function(T failedVal)? shortPassword,
    TResult Function(T failedVal)? empty,
    TResult Function(T failedVal, int maxLength)? exceededLength,
  }) {
    return empty?.call(failedVal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedVal)? invalidEmail,
    TResult Function(T failedVal)? shortPassword,
    TResult Function(T failedVal)? empty,
    TResult Function(T failedVal, int maxLength)? exceededLength,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(failedVal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidEmail<T> value) invalidEmail,
    required TResult Function(_ShortPassword<T> value) shortPassword,
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_ExceededLength<T> value) exceededLength,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InvalidEmail<T> value)? invalidEmail,
    TResult Function(_ShortPassword<T> value)? shortPassword,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_ExceededLength<T> value)? exceededLength,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidEmail<T> value)? invalidEmail,
    TResult Function(_ShortPassword<T> value)? shortPassword,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_ExceededLength<T> value)? exceededLength,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty<T> extends ValueFailure<T> {
  const factory _Empty(T failedVal) = _$_Empty<T>;
  const _Empty._() : super._();

  @override
  T get failedVal => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EmptyCopyWith<T, _Empty<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ExceededLengthCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$ExceededLengthCopyWith(
          _ExceededLength<T> value, $Res Function(_ExceededLength<T>) then) =
      __$ExceededLengthCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedVal, int maxLength});
}

/// @nodoc
class __$ExceededLengthCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements _$ExceededLengthCopyWith<T, $Res> {
  __$ExceededLengthCopyWithImpl(
      _ExceededLength<T> _value, $Res Function(_ExceededLength<T>) _then)
      : super(_value, (v) => _then(v as _ExceededLength<T>));

  @override
  _ExceededLength<T> get _value => super._value as _ExceededLength<T>;

  @override
  $Res call({
    Object? failedVal = freezed,
    Object? maxLength = freezed,
  }) {
    return _then(_ExceededLength<T>(
      failedVal == freezed
          ? _value.failedVal
          : failedVal // ignore: cast_nullable_to_non_nullable
              as T,
      maxLength == freezed
          ? _value.maxLength
          : maxLength // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ExceededLength<T> extends _ExceededLength<T> {
  const _$_ExceededLength(this.failedVal, this.maxLength) : super._();

  @override
  final T failedVal;
  @override
  final int maxLength;

  @override
  String toString() {
    return 'ValueFailure<$T>.exceededLength(failedVal: $failedVal, maxLength: $maxLength)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ExceededLength<T> &&
            (identical(other.failedVal, failedVal) ||
                const DeepCollectionEquality()
                    .equals(other.failedVal, failedVal)) &&
            (identical(other.maxLength, maxLength) ||
                const DeepCollectionEquality()
                    .equals(other.maxLength, maxLength)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(failedVal) ^
      const DeepCollectionEquality().hash(maxLength);

  @JsonKey(ignore: true)
  @override
  _$ExceededLengthCopyWith<T, _ExceededLength<T>> get copyWith =>
      __$ExceededLengthCopyWithImpl<T, _ExceededLength<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedVal) invalidEmail,
    required TResult Function(T failedVal) shortPassword,
    required TResult Function(T failedVal) empty,
    required TResult Function(T failedVal, int maxLength) exceededLength,
  }) {
    return exceededLength(failedVal, maxLength);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T failedVal)? invalidEmail,
    TResult Function(T failedVal)? shortPassword,
    TResult Function(T failedVal)? empty,
    TResult Function(T failedVal, int maxLength)? exceededLength,
  }) {
    return exceededLength?.call(failedVal, maxLength);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedVal)? invalidEmail,
    TResult Function(T failedVal)? shortPassword,
    TResult Function(T failedVal)? empty,
    TResult Function(T failedVal, int maxLength)? exceededLength,
    required TResult orElse(),
  }) {
    if (exceededLength != null) {
      return exceededLength(failedVal, maxLength);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InvalidEmail<T> value) invalidEmail,
    required TResult Function(_ShortPassword<T> value) shortPassword,
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_ExceededLength<T> value) exceededLength,
  }) {
    return exceededLength(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InvalidEmail<T> value)? invalidEmail,
    TResult Function(_ShortPassword<T> value)? shortPassword,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_ExceededLength<T> value)? exceededLength,
  }) {
    return exceededLength?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InvalidEmail<T> value)? invalidEmail,
    TResult Function(_ShortPassword<T> value)? shortPassword,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_ExceededLength<T> value)? exceededLength,
    required TResult orElse(),
  }) {
    if (exceededLength != null) {
      return exceededLength(this);
    }
    return orElse();
  }
}

abstract class _ExceededLength<T> extends ValueFailure<T> {
  const factory _ExceededLength(T failedVal, int maxLength) =
      _$_ExceededLength<T>;
  const _ExceededLength._() : super._();

  @override
  T get failedVal => throw _privateConstructorUsedError;
  int get maxLength => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ExceededLengthCopyWith<T, _ExceededLength<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
