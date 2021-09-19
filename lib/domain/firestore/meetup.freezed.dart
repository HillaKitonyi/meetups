// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'meetup.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Meetup _$MeetupFromJson(Map<String, dynamic> json) {
  return _Meetup.fromJson(json);
}

/// @nodoc
class _$MeetupTearOff {
  const _$MeetupTearOff();

  _Meetup call(
      {required MeetupCategory category,
      required String uid,
      required String title,
      required String? photoUrl,
      required String description,
      required String location,
      required DateTime dateAndTime}) {
    return _Meetup(
      category: category,
      uid: uid,
      title: title,
      photoUrl: photoUrl,
      description: description,
      location: location,
      dateAndTime: dateAndTime,
    );
  }

  Meetup fromJson(Map<String, Object> json) {
    return Meetup.fromJson(json);
  }
}

/// @nodoc
const $Meetup = _$MeetupTearOff();

/// @nodoc
mixin _$Meetup {
  MeetupCategory get category => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  DateTime get dateAndTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeetupCopyWith<Meetup> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeetupCopyWith<$Res> {
  factory $MeetupCopyWith(Meetup value, $Res Function(Meetup) then) =
      _$MeetupCopyWithImpl<$Res>;
  $Res call(
      {MeetupCategory category,
      String uid,
      String title,
      String? photoUrl,
      String description,
      String location,
      DateTime dateAndTime});
}

/// @nodoc
class _$MeetupCopyWithImpl<$Res> implements $MeetupCopyWith<$Res> {
  _$MeetupCopyWithImpl(this._value, this._then);

  final Meetup _value;
  // ignore: unused_field
  final $Res Function(Meetup) _then;

  @override
  $Res call({
    Object? category = freezed,
    Object? uid = freezed,
    Object? title = freezed,
    Object? photoUrl = freezed,
    Object? description = freezed,
    Object? location = freezed,
    Object? dateAndTime = freezed,
  }) {
    return _then(_value.copyWith(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as MeetupCategory,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      dateAndTime: dateAndTime == freezed
          ? _value.dateAndTime
          : dateAndTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$MeetupCopyWith<$Res> implements $MeetupCopyWith<$Res> {
  factory _$MeetupCopyWith(_Meetup value, $Res Function(_Meetup) then) =
      __$MeetupCopyWithImpl<$Res>;
  @override
  $Res call(
      {MeetupCategory category,
      String uid,
      String title,
      String? photoUrl,
      String description,
      String location,
      DateTime dateAndTime});
}

/// @nodoc
class __$MeetupCopyWithImpl<$Res> extends _$MeetupCopyWithImpl<$Res>
    implements _$MeetupCopyWith<$Res> {
  __$MeetupCopyWithImpl(_Meetup _value, $Res Function(_Meetup) _then)
      : super(_value, (v) => _then(v as _Meetup));

  @override
  _Meetup get _value => super._value as _Meetup;

  @override
  $Res call({
    Object? category = freezed,
    Object? uid = freezed,
    Object? title = freezed,
    Object? photoUrl = freezed,
    Object? description = freezed,
    Object? location = freezed,
    Object? dateAndTime = freezed,
  }) {
    return _then(_Meetup(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as MeetupCategory,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      dateAndTime: dateAndTime == freezed
          ? _value.dateAndTime
          : dateAndTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Meetup implements _Meetup {
  const _$_Meetup(
      {required this.category,
      required this.uid,
      required this.title,
      required this.photoUrl,
      required this.description,
      required this.location,
      required this.dateAndTime});

  factory _$_Meetup.fromJson(Map<String, dynamic> json) =>
      _$$_MeetupFromJson(json);

  @override
  final MeetupCategory category;
  @override
  final String uid;
  @override
  final String title;
  @override
  final String? photoUrl;
  @override
  final String description;
  @override
  final String location;
  @override
  final DateTime dateAndTime;

  @override
  String toString() {
    return 'Meetup(category: $category, uid: $uid, title: $title, photoUrl: $photoUrl, description: $description, location: $location, dateAndTime: $dateAndTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Meetup &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.photoUrl, photoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.photoUrl, photoUrl)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.dateAndTime, dateAndTime) ||
                const DeepCollectionEquality()
                    .equals(other.dateAndTime, dateAndTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(photoUrl) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(dateAndTime);

  @JsonKey(ignore: true)
  @override
  _$MeetupCopyWith<_Meetup> get copyWith =>
      __$MeetupCopyWithImpl<_Meetup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MeetupToJson(this);
  }
}

abstract class _Meetup implements Meetup {
  const factory _Meetup(
      {required MeetupCategory category,
      required String uid,
      required String title,
      required String? photoUrl,
      required String description,
      required String location,
      required DateTime dateAndTime}) = _$_Meetup;

  factory _Meetup.fromJson(Map<String, dynamic> json) = _$_Meetup.fromJson;

  @override
  MeetupCategory get category => throw _privateConstructorUsedError;
  @override
  String get uid => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String? get photoUrl => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get location => throw _privateConstructorUsedError;
  @override
  DateTime get dateAndTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MeetupCopyWith<_Meetup> get copyWith => throw _privateConstructorUsedError;
}
