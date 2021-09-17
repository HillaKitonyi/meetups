import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetups/domain/auth/auth_failure.dart';
import 'package:meetups/domain/auth/value_validators.dart';
import 'package:meetups/infrastructure/fire_auth_service.dart';
import 'package:meetups/logic/sign_in/sign_in_state.dart';

final signInModelProvider = StateNotifierProvider<SignInModel, SignInPageState>((ref) {
  final authService = FireAuthService.instance;
  return SignInModel(authService);
}, name: 'signInModelProvider');

class SignInModel extends StateNotifier<SignInPageState> {
  final FireAuthService authService;
  SignInModel(this.authService) : super(SignInPageState.initial());

  void emailChanged(String emailStr) {
    state = state.copyWith(email: emailStr, authFailureOrSuccess: null);
  }

  void passwordChanged(String passwordStr) {
    state = state.copyWith(password: passwordStr, authFailureOrSuccess: null);
  }

  void showPasswordToggled() {
    state = state.copyWith(showPassword: !state.showPassword, authFailureOrSuccess: null);
  }

  Future<void> loginButtonPressed() async {
    Either<AuthFailure, Unit>? possibleFailure;
    final emailIsValid = validateEmail(state.email).isRight();
    final passwordIsValid = validateEmail(state.password).isRight();
    if (emailIsValid && passwordIsValid) {
      state = state.copyWith(loading: true, authFailureOrSuccess: null);
      possibleFailure = await authService.signInWithEmailAndPassword(state.email, state.password);
    }

    state = state.copyWith(authFailureOrSuccess: possibleFailure, loading: false, showErrors: true);
  }

  Future<void> registerButtonPressed() async {
    Either<AuthFailure, Unit>? possibleFailure;
    final emailIsValid = validateEmail(state.email).isRight();
    final passwordIsValid = validateEmail(state.password).isRight();
    if (emailIsValid && passwordIsValid) {
      state = state.copyWith(loading: true, authFailureOrSuccess: null);
      possibleFailure = await authService.registerWithEmailAndPassword(state.email, state.password);
    }
    state = state.copyWith(authFailureOrSuccess: possibleFailure, loading: false, showErrors: true);
  }

  Future<void> googleButtonPressed() async {
    state = state.copyWith(loading: true, authFailureOrSuccess: null);
    final possibleFailure = await authService.signInWithGoogle();
    state = state.copyWith(authFailureOrSuccess: possibleFailure, loading: false);
  }
}
