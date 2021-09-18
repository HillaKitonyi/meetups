import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'app_user.freezed.dart';

@freezed
abstract class AppUser with _$AppUser {
  const factory AppUser({
    required String uid,
    required String email,
    required String username,
    required String? photoURL,
  }) = _AppUser;

  factory AppUser.empty() => AppUser(
        uid: const Uuid().v1(),
        email: 'youremail@example.com',
        username: 'username',
        photoURL: null,
      );

  factory AppUser.fromFirebaseUser(User user) {
    return AppUser(
      uid: user.uid,
      email: user.email ?? 'youremail@example.com',
      username: user.displayName ?? 'username',
      photoURL: user.photoURL,
    );
  }
}
