import 'package:freezed_annotation/freezed_annotation.dart';

part 'storage_failures.freezed.dart';

@freezed
abstract class StorageFailure with _$StorageFailure {
  const factory StorageFailure.serverError(String errMessage) = _ServerError;
}
