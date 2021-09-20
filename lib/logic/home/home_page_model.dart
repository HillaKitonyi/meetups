import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetups/domain/firestore/meetup.dart';
import 'package:meetups/infrastructure/fire_auth_service.dart';
import 'package:meetups/infrastructure/fire_store_service.dart';
import 'package:meetups/logic/home/home_page_state.dart';

final homePageModelProvider = StateNotifierProvider<HomePageModel, HomePageState>((ref) {
  return HomePageModel(FireAuthService.instance, FireStoreService.instance);
}, name: 'homePageModelProvider');

class HomePageModel extends StateNotifier<HomePageState> {
  final FireAuthService authService;
  final FireStoreService storeService;
  StreamSubscription? meetupsSubscription;

  HomePageModel(this.authService, this.storeService) : super(HomePageState.initial()) {
    meetupsSubscription = storeService.watchMeetups().listen(_meetupsLoaded);
  }

  void _meetupsLoaded(List<Meetup> meetups) {
    state = state.copyWith(featuredMeetups: meetups);
  }

  Future<void> onLogoutRequest() => authService.logout();

  @override
  void dispose() {
    meetupsSubscription?.cancel();
    super.dispose();
  }
}
