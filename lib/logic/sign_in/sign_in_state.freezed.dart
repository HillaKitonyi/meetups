// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_in_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignInPageStateTearOff {
  const _$SignInPageStateTearOff();

  _SignInPageState call(
      {required String email,
      required String password,
      required GlobalKey<FormState> formKey,
      required bool loading,
      required bool showPassword,
      required bool showErrors,
      required Either<AuthFailure, Unit>? authFailureOrSuccess}) {
    return _SignInPageState(
      email: email,
      password: password,
      formKey: formKey,
      loading: loading,
      showPassword: showPassword,
      showErrors: showErrors,
      authFailureOrSuccess: authFailureOrSuccess,
    );
  }
}

/// @nodoc
const $SignInPageState = _$SignInPageStateTearOff();

/// @nodoc
mixin _$SignInPageState {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  GlobalKey<FormState> get formKey => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get showPassword => throw _privateConstructorUsedError;
  bool get showErrors => throw _privateConstructorUsedError;
  Either<AuthFailure, Unit>? get authFailureOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInPageStateCopyWith<SignInPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInPageStateCopyWith<$Res> {
  factory $SignInPageStateCopyWith(
          SignInPageState value, $Res Function(SignInPageState) then) =
      _$SignInPageStateCopyWithImpl<$Res>;
  $Res call(
      {String email,
      String password,
      GlobalKey<FormState> formKey,
      bool loading,
      bool showPassword,
      bool showErrors,
      Either<AuthFailure, Unit>? authFailureOrSuccess});
}

/// @nodoc
class _$SignInPageStateCopyWithImpl<$Res>
    implements $SignInPageStateCopyWith<$Res> {
  _$SignInPageStateCopyWithImpl(this._value, this._then);

  final SignInPageState _value;
  // ignore: unused_field
  final $Res Function(SignInPageState) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? formKey = freezed,
    Object? loading = freezed,
    Object? showPassword = freezed,
    Object? showErrors = freezed,
    Object? authFailureOrSuccess = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      formKey: formKey == freezed
          ? _value.formKey
          : formKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      showPassword: showPassword == freezed
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrors: showErrors == freezed
          ? _value.showErrors
          : showErrors // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccess: authFailureOrSuccess == freezed
          ? _value.authFailureOrSuccess
          : authFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Either<AuthFailure, Unit>?,
    ));
  }
}

/// @nodoc
abstract class _$SignInPageStateCopyWith<$Res>
    implements $SignInPageStateCopyWith<$Res> {
  factory _$SignInPageStateCopyWith(
          _SignInPageState value, $Res Function(_SignInPageState) then) =
      __$SignInPageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String email,
      String password,
      GlobalKey<FormState> formKey,
      bool loading,
      bool showPassword,
      bool showErrors,
      Either<AuthFailure, Unit>? authFailureOrSuccess});
}

/// @nodoc
class __$SignInPageStateCopyWithImpl<$Res>
    extends _$SignInPageStateCopyWithImpl<$Res>
    implements _$SignInPageStateCopyWith<$Res> {
  __$SignInPageStateCopyWithImpl(
      _SignInPageState _value, $Res Function(_SignInPageState) _then)
      : super(_value, (v) => _then(v as _SignInPageState));

  @override
  _SignInPageState get _value => super._value as _SignInPageState;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? formKey = freezed,
    Object? loading = freezed,
    Object? showPassword = freezed,
    Object? showErrors = freezed,
    Object? authFailureOrSuccess = freezed,
  }) {
    return _then(_SignInPageState(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      formKey: formKey == freezed
          ? _value.formKey
          : formKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      showPassword: showPassword == freezed
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrors: showErrors == freezed
          ? _value.showErrors
          : showErrors // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccess: authFailureOrSuccess == freezed
          ? _value.authFailureOrSuccess
          : authFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Either<AuthFailure, Unit>?,
    ));
  }
}

/// @nodoc

class _$_SignInPageState implements _SignInPageState {
  const _$_SignInPageState(
      {required this.email,
      required this.password,
      required this.formKey,
      required this.loading,
      required this.showPassword,
      required this.showErrors,
      required this.authFailureOrSuccess});

  @override
  final String email;
  @override
  final String password;
  @override
  final GlobalKey<FormState> formKey;
  @override
  final bool loading;
  @override
  final bool showPassword;
  @override
  final bool showErrors;
  @override
  final Either<AuthFailure, Unit>? authFailureOrSuccess;

  @override
  String toString() {
    return 'SignInPageState(email: $email, password: $password, formKey: $formKey, loading: $loading, showPassword: $showPassword, showErrors: $showErrors, authFailureOrSuccess: $authFailureOrSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignInPageState &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.formKey, formKey) ||
                const DeepCollectionEquality()
                    .equals(other.formKey, formKey)) &&
            (identical(other.loading, loading) ||
                const DeepCollectionEquality()
                    .equals(other.loading, loading)) &&
            (identical(other.showPassword, showPassword) ||
                const DeepCollectionEquality()
                    .equals(other.showPassword, showPassword)) &&
            (identical(other.showErrors, showErrors) ||
                const DeepCollectionEquality()
                    .equals(other.showErrors, showErrors)) &&
            (identical(other.authFailureOrSuccess, authFailureOrSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.authFailureOrSuccess, authFailureOrSuccess)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(formKey) ^
      const DeepCollectionEquality().hash(loading) ^
      const DeepCollectionEquality().hash(showPassword) ^
      const DeepCollectionEquality().hash(showErrors) ^
      const DeepCollectionEquality().hash(authFailureOrSuccess);

  @JsonKey(ignore: true)
  @override
  _$SignInPageStateCopyWith<_SignInPageState> get copyWith =>
      __$SignInPageStateCopyWithImpl<_SignInPageState>(this, _$identity);
}

abstract class _SignInPageState implements SignInPageState {
  const factory _SignInPageState(
          {required String email,
          required String password,
          required GlobalKey<FormState> formKey,
          required bool loading,
          required bool showPassword,
          required bool showErrors,
          required Either<AuthFailure, Unit>? authFailureOrSuccess}) =
      _$_SignInPageState;

  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  GlobalKey<FormState> get formKey => throw _privateConstructorUsedError;
  @override
  bool get loading => throw _privateConstructorUsedError;
  @override
  bool get showPassword => throw _privateConstructorUsedError;
  @override
  bool get showErrors => throw _privateConstructorUsedError;
  @override
  Either<AuthFailure, Unit>? get authFailureOrSuccess =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SignInPageStateCopyWith<_SignInPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
