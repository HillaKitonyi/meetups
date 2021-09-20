import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meetups/domain/firestore/firestore_failures.dart';
import 'package:meetups/domain/firestore/meetup.dart';
import 'package:meetups/domain/firestore/meetup_category.dart';
import 'package:meetups/domain/storage/storage_failures.dart';
import 'package:meetups/infrastructure/fire_storage_service.dart';
import 'package:meetups/infrastructure/fire_store_service.dart';
import 'package:meetups/logic/organize_meetup/organize_meetup_page_state.dart';
import 'package:uuid/uuid.dart';

final organizeMeetupModelProvider =
    StateNotifierProvider<OrganizeMeetupPageModel, OrganizeMeetupPageState>((ref) {
  return OrganizeMeetupPageModel(OrganizeMeetupPageState.initial());
}, name: 'organizeMeetupModelProvider');

class OrganizeMeetupPageModel extends StateNotifier<OrganizeMeetupPageState> {
  OrganizeMeetupPageModel(OrganizeMeetupPageState state) : super(state);
  final FireStoreService fireStoreService = FireStoreService.instance;
  final FireStorageService storageService = FireStorageService.instance;
  final _imagePicker = ImagePicker();

  void meetupTitleChanged(String titleStr) {
    state = state.copyWith(title: titleStr, databaseFailureOrSuccess: null);
  }

  void meetupCategoryChanged(MeetupCategory category) {
    state = state.copyWith(category: category, databaseFailureOrSuccess: null);
    if (state.photoURL == null || state.photoURL?.contains('asset') == true) {
      state = state.copyWith(photoURL: state.category.assetPicturePath());
    }
  }

  Future<void> showImageSourceModalBottomSheet(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (context) {
        return Container(
          height: 200,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(18),
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Column(
            children: [
              const Text(
                'Image Source',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 20),
              Row(children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      await _onPickImage(ImageSource.camera);
                      Navigator.pop(context);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt_rounded,
                          size: 50,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'CAMERA',
                          style: TextStyle(
                              fontSize: 20, letterSpacing: 1, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      await _onPickImage(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.photo_library_rounded,
                          size: 50,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'GALLERY',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, letterSpacing: 1, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ],
          ),
        );
      },
    );
  }

  Future<void> _onPickImage(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source);
    if (pickedFile == null) return;
    state = state.copyWith(photoURL: pickedFile.path, databaseFailureOrSuccess: null);
  }

  void meetupDescriptionChanged(String descriptionStr) {
    state = state.copyWith(description: descriptionStr, databaseFailureOrSuccess: null);
  }

  void meetupLocationChanged(String locationStr) {
    state = state.copyWith(location: locationStr, databaseFailureOrSuccess: null);
  }

  void meetupTimeChanged(TimeOfDay? timeOfDay) {
    state = state.copyWith(timeOfDay: timeOfDay ?? TimeOfDay.now(), databaseFailureOrSuccess: null);
  }

  void meetupDateChanged(DateTime? date) {
    state = state.copyWith(date: date ?? DateTime.now(), databaseFailureOrSuccess: null);
  }

  Future<void> onSubmitClicked(String uid) async {
    late Option<Either<FirestoreFailure, StorageFailure>> possibleFailure;
    String? downloadURL;
    final String meetupID = const Uuid().v1();
    final formIsValid = state.formKey.currentState?.validate() ?? false;

    if (!formIsValid) {
      state = state.copyWith(showErrors: true, databaseFailureOrSuccess: null);
      return;
    }

    state = state.copyWith(loading: true, databaseFailureOrSuccess: null);
    if (state.photoURL?.contains('assets') == false) {
      possibleFailure = await storageService
          .storeUserImage(File(state.photoURL!), StoragePath.meetups(meetupID))
          .then((storageFailureOrString) => storageFailureOrString.fold(
                (failure) => some(right(failure)),
                (val) {
                  downloadURL = val;
                  return none();
                },
              ));
    }

    final dateAndTime = DateTime(
      state.date.year,
      state.date.month,
      state.date.day,
      state.timeOfDay.hour,
      state.timeOfDay.minute,
    );
    final meetup = Meetup.initial().copyWith(
      uid: meetupID,
      creatorID: uid,
      category: state.category,
      title: state.title,
      photoUrl: downloadURL,
      description: state.description,
      location: state.location,
      dateAndTime: dateAndTime,
    );
    possibleFailure = await fireStoreService
        .createMeetup(meetup)
        .then((firestoreFailureOrUnit) => firestoreFailureOrUnit.fold(
              (failure) => some(left(failure)),
              (_) => none(),
            ));
    state = state.copyWith(loading: false, databaseFailureOrSuccess: possibleFailure);
    onReset();
  }

  void onReset() => state = OrganizeMeetupPageState.initial();
}
