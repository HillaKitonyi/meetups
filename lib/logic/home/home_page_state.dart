import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meetups/domain/firestore/meetup.dart';

part 'home_page_state.freezed.dart';

@freezed
abstract class HomePageState with _$HomePageState {
  const factory HomePageState({required List<Meetup> featuredMeetups}) = _HomePageState;

  factory HomePageState.initial() => const HomePageState(featuredMeetups: []);
}
