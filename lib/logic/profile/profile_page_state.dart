import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meetups/domain/auth/app_user.dart';
import 'package:meetups/domain/auth/auth_failure.dart';

part 'profile_page_state.freezed.dart';

@freezed
abstract class ProfilePageState with _$ProfilePageState {
  const factory ProfilePageState({
    required String? photoURL,
    required bool edited,
    required String email,
    required String username,
    required String password,
    required bool loading,
    required bool showPassword,
    required bool showErrors,
    required Either<AuthFailure, Unit>? authFailureOrSuccess,
  }) = _ProfilePageState;

  factory ProfilePageState.initial(AppUser? appUser) => ProfilePageState(
        photoURL: appUser?.photoURL,
        edited: false,
        email: appUser!.email,
        username: appUser.username,
        password: '',
        loading: false,
        showPassword: false,
        showErrors: false,
        authFailureOrSuccess: null,
      );
}
