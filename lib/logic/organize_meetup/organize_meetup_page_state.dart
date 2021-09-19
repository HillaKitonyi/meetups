import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meetups/domain/firestore/firestore_failures.dart';
import 'package:meetups/domain/firestore/meetup.dart';
import 'package:meetups/domain/firestore/meetup_category.dart';

part 'organize_meetup_page_state.freezed.dart';

@freezed
abstract class OrganizeMeetupPageState with _$OrganizeMeetupPageState {
  const factory OrganizeMeetupPageState({
    required GlobalKey<FormState> formKey,
    required bool loading,
    required bool showErrors,
    required bool isEditing,
    required String title,
    required MeetupCategory category,
    required String? photoURL,
    required String description,
    required String location,
    required TimeOfDay timeOfDay,
    required DateTime date,
    required Either<FirestoreFailure, Unit>? databaseFailureOrSuccess,
  }) = _OrganizeMeetupPageState;

  factory OrganizeMeetupPageState.initial() => OrganizeMeetupPageState(
        formKey: GlobalKey<FormState>(),
        loading: false,
        showErrors: false,
        isEditing: false,
        title: '',
        category: MeetupCategory.general,
        photoURL: null,
        description: '',
        location: '',
        timeOfDay: TimeOfDay.now(),
        date: DateTime.now(),
        databaseFailureOrSuccess: null,
      );

  factory OrganizeMeetupPageState.fromMeetup(Meetup meetup) => OrganizeMeetupPageState(
        formKey: GlobalKey<FormState>(),
        loading: false,
        showErrors: false,
        isEditing: true,
        title: meetup.title,
        category: meetup.category,
        photoURL: meetup.photoUrl,
        description: meetup.description,
        location: meetup.location,
        timeOfDay: TimeOfDay.fromDateTime(meetup.dateAndTime),
        date: meetup.dateAndTime,
        databaseFailureOrSuccess: null,
      );
}
