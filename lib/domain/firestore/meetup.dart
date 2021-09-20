import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meetups/domain/firestore/meetup_category.dart';
import 'package:uuid/uuid.dart';

part 'meetup.freezed.dart';
part 'meetup.g.dart';

@freezed
abstract class Meetup with _$Meetup {
  const factory Meetup({
    @JsonKey(ignore: true) String? uid,
    required MeetupCategory category,
    required String? creatorID,
    required String title,
    required String? photoUrl,
    required String description,
    required String location,
    required DateTime dateAndTime,
  }) = _Meetup;

  factory Meetup.initial() => Meetup(
        category: MeetupCategory.general,
        creatorID: null,
        uid: const Uuid().v1(),
        title: '',
        photoUrl: null,
        description: '',
        location: '',
        dateAndTime: DateTime.now(),
      );

  factory Meetup.fromJson(Map<String, dynamic> json) => _$MeetupFromJson(json);
}
