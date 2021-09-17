import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meetups/domain/auth/auth_failure.dart';

part 'sign_in_state.freezed.dart';

@freezed
abstract class SignInPageState with _$SignInPageState {
  const factory SignInPageState({
    required String email,
    required String password,
    required GlobalKey<FormState> formKey,
    required bool loading,
    required bool showPassword,
    required bool showErrors,
    required Either<AuthFailure, Unit>? authFailureOrSuccess,
  }) = _SignInPageState;

  factory SignInPageState.initial() => SignInPageState(
        email: '',
        password: '',
        loading: false,
        showPassword: false,
        showErrors: false,
        authFailureOrSuccess: null,
        formKey: GlobalKey<FormState>(),
      );
}
