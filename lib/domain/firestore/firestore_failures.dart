import 'package:freezed_annotation/freezed_annotation.dart';

part 'firestore_failures.freezed.dart';

@freezed
abstract class FirestoreFailure with _$FirestoreFailure {
  const factory FirestoreFailure.serverError() = _ServerError;
}
