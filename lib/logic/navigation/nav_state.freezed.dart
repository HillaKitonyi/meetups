// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'nav_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NavStateTearOff {
  const _$NavStateTearOff();

  _NavState call({required DrawerItem drawerItem}) {
    return _NavState(
      drawerItem: drawerItem,
    );
  }
}

/// @nodoc
const $NavState = _$NavStateTearOff();

/// @nodoc
mixin _$NavState {
  DrawerItem get drawerItem => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NavStateCopyWith<NavState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavStateCopyWith<$Res> {
  factory $NavStateCopyWith(NavState value, $Res Function(NavState) then) =
      _$NavStateCopyWithImpl<$Res>;
  $Res call({DrawerItem drawerItem});
}

/// @nodoc
class _$NavStateCopyWithImpl<$Res> implements $NavStateCopyWith<$Res> {
  _$NavStateCopyWithImpl(this._value, this._then);

  final NavState _value;
  // ignore: unused_field
  final $Res Function(NavState) _then;

  @override
  $Res call({
    Object? drawerItem = freezed,
  }) {
    return _then(_value.copyWith(
      drawerItem: drawerItem == freezed
          ? _value.drawerItem
          : drawerItem // ignore: cast_nullable_to_non_nullable
              as DrawerItem,
    ));
  }
}

/// @nodoc
abstract class _$NavStateCopyWith<$Res> implements $NavStateCopyWith<$Res> {
  factory _$NavStateCopyWith(_NavState value, $Res Function(_NavState) then) =
      __$NavStateCopyWithImpl<$Res>;
  @override
  $Res call({DrawerItem drawerItem});
}

/// @nodoc
class __$NavStateCopyWithImpl<$Res> extends _$NavStateCopyWithImpl<$Res>
    implements _$NavStateCopyWith<$Res> {
  __$NavStateCopyWithImpl(_NavState _value, $Res Function(_NavState) _then)
      : super(_value, (v) => _then(v as _NavState));

  @override
  _NavState get _value => super._value as _NavState;

  @override
  $Res call({
    Object? drawerItem = freezed,
  }) {
    return _then(_NavState(
      drawerItem: drawerItem == freezed
          ? _value.drawerItem
          : drawerItem // ignore: cast_nullable_to_non_nullable
              as DrawerItem,
    ));
  }
}

/// @nodoc

class _$_NavState implements _NavState {
  const _$_NavState({required this.drawerItem});

  @override
  final DrawerItem drawerItem;

  @override
  String toString() {
    return 'NavState(drawerItem: $drawerItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NavState &&
            (identical(other.drawerItem, drawerItem) ||
                const DeepCollectionEquality()
                    .equals(other.drawerItem, drawerItem)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(drawerItem);

  @JsonKey(ignore: true)
  @override
  _$NavStateCopyWith<_NavState> get copyWith =>
      __$NavStateCopyWithImpl<_NavState>(this, _$identity);
}

abstract class _NavState implements NavState {
  const factory _NavState({required DrawerItem drawerItem}) = _$_NavState;

  @override
  DrawerItem get drawerItem => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NavStateCopyWith<_NavState> get copyWith =>
      throw _privateConstructorUsedError;
}
