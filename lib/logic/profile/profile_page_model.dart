import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meetups/domain/auth/app_user.dart';
import 'package:meetups/infrastructure/fire_auth_service.dart';
import 'package:meetups/infrastructure/fire_storage_service.dart';
import 'package:meetups/logic/profile/profile_page_state.dart';

final profilePageModelProvider = StateNotifierProvider<ProfilePageModel, ProfilePageState>((ref) {
  final authService = FireAuthService.instance;
  final storageService = FireStorageService.instance;
  return ref.watch(appUserStreamProvider).maybeWhen(
        data: (userOption) => userOption.fold(
          () => ProfilePageModel(AppUser.empty(), authService, storageService, ref),
          (appUser) => ProfilePageModel(appUser, authService, storageService, ref),
        ),
        orElse: () => ProfilePageModel(AppUser.empty(), authService, storageService, ref),
      );
}, name: 'profilePageModelProvider');

class ProfilePageModel extends StateNotifier<ProfilePageState> {
  final FireAuthService authService;
  final FireStorageService storageService;
  final AppUser appUser;
  final ProviderRefBase ref;
  ProfilePageModel(
    this.appUser,
    this.authService,
    this.storageService,
    this.ref,
  ) : super(ProfilePageState.initial(appUser));

  final _imagePicker = ImagePicker();

  Future<void> onPickImage(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source);
    if (pickedFile == null) return;
    state = state.copyWith(photoURL: pickedFile.path, authFailureOrSuccess: null, edited: true);
  }

  void emailChanged(String emailString) {
    state = state.copyWith(email: emailString, authFailureOrSuccess: null);
  }

  void usernameChanged(String usernameString) {
    state = state.copyWith(username: usernameString, authFailureOrSuccess: null);
  }

  void passwordChanged(String passwordString) {
    state = state.copyWith(password: passwordString, authFailureOrSuccess: null);
  }

  void toggleShowPassword() {
    state = state.copyWith(showPassword: !state.showPassword, authFailureOrSuccess: null);
  }

  void revertProfileImage(String? photoURL) {
    state = state.copyWith(photoURL: photoURL, authFailureOrSuccess: null, edited: false);
  }

  void onCancelPressed(BuildContext context) {
    state = ProfilePageState.initial(appUser);
    Navigator.maybePop(context);
  }

  Future<void> onSubmitPressed() async {
    // if edited -> save pic to cloud storage
    state = state.copyWith(loading: true, authFailureOrSuccess: null);
    if (state.edited && state.photoURL != null) {
      final selectedFile = File(state.photoURL!);
      final userID = ref.read(appUserProvider).uid;
      final failureOrPhotoURL = await storageService.storeUserImage(selectedFile, userID);
      // get downloadURL -> update state.photoURL with downloadURL
      failureOrPhotoURL.fold(
        (_) {},
        (photoURL) => state = state.copyWith(photoURL: photoURL, edited: false),
      );
    }
    // update _auth.curretUser properties.
    final editedAppUser = appUser.copyWith(
      email: state.email,
      photoURL: state.photoURL,
      username: state.username,
    );
    final possibleFailure = await authService.updateFirebaseUser(editedAppUser, state.password);
    state = state.copyWith(authFailureOrSuccess: possibleFailure, loading: false, edited: false);
    ref.refresh(appUserStreamProvider);
  }

  void displaySuccessSnackbar(BuildContext context, String message) {
    final flushbar = Flushbar(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      flushbarStyle: FlushbarStyle.FLOATING,
      duration: const Duration(seconds: 6),
      isDismissible: true,
      icon: Icon(
        Icons.check_circle_outline_rounded,
        size: 28,
        color: Colors.green[300],
      ),
      message: message,
    );
    flushbar.show(context);
  }

  void displayErrorSnackbar(BuildContext context, String message) {
    final flushbar = Flushbar(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      flushbarStyle: FlushbarStyle.FLOATING,
      duration: const Duration(seconds: 6),
      isDismissible: true,
      icon: Icon(
        Icons.warning,
        size: 28.0,
        color: Colors.red[300],
      ),
      message: message,
    );
    flushbar.show(context);
  }
}
