import 'package:freezed_annotation/freezed_annotation.dart';

part 'firestore_failures.freezed.dart';

@freezed
abstract class FirestoreFailure implements _$FirestoreFailure {
  const FirestoreFailure._();

  const factory FirestoreFailure.serverError() = _ServerError;
  const factory FirestoreFailure.permissionDenied() = _PermissionDenied;

  String get message => when(
        serverError: () => 'Server error. Please try again later.',
        permissionDenied: () => 'Permission denied.',
      );
}
