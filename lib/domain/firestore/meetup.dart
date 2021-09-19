import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meetups/domain/firestore/meetup_category.dart';
import 'package:uuid/uuid.dart';

part 'meetup.freezed.dart';
part 'meetup.g.dart';

@freezed
abstract class Meetup with _$Meetup {
  const factory Meetup({
    required MeetupCategory category,
    required String uid,
    required String title,
    required String? photoUrl,
    required String description,
    required String location,
    required DateTime dateAndTime,
  }) = _Meetup;

  factory Meetup.initial() => Meetup(
        category: MeetupCategory.general,
        uid: const Uuid().v1(),
        title: '',
        photoUrl: null,
        description: '',
        location: '',
        dateAndTime: DateTime.now(),
      );

  factory Meetup.fromJson(Map<String, dynamic> json) => _$MeetupFromJson(json);
}
