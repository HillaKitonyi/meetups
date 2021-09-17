import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
abstract class AuthFailure implements _$AuthFailure {
  const AuthFailure._();

  const factory AuthFailure.serverError() = _ServerError;
  const factory AuthFailure.cancelled() = _Cancelled;
  const factory AuthFailure.wrongEmailPassword() = _WrongEmailPassword;
  const factory AuthFailure.tooManyRequests() = _TooManyRequests;
  const factory AuthFailure.emailAlreadyInUse() = _EmailAlreadyInUse;

  String get message => when(
        serverError: () => 'Server Error. Please try again later.',
        cancelled: () => 'Operation cancelled',
        wrongEmailPassword: () => 'Wrong email or password. Please check again.',
        tooManyRequests: () => 'Too many failed requests. Please try again later.',
        emailAlreadyInUse: () => 'That email is already in use by another account.',
      );
}
