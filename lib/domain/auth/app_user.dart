import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';

@freezed
abstract class AppUser with _$AppUser {
  const factory AppUser({
    required String uid,
    required String? email,
    required String? username,
    required String? photoURL,
  }) = _AppUser;

  factory AppUser.fromFirebaseUser(User user) {
    return AppUser(
      uid: user.uid,
      email: user.email ?? 'youremail@example.com',
      username: user.displayName ?? 'username',
      photoURL: user.photoURL,
    );
  }
}
