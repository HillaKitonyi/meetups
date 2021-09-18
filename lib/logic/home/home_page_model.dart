import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetups/infrastructure/fire_auth_service.dart';
import 'package:meetups/logic/home/home_page_state.dart';

final homePageModelProvider = StateNotifierProvider<HomePageModel, HomePageState>((ref) {
  return HomePageModel(FireAuthService.instance);
}, name: 'homePageModelProvider');

class HomePageModel extends StateNotifier<HomePageState> {
  final FireAuthService authService;
  HomePageModel(this.authService) : super(HomePageState.initial());

  Future<void> onLogoutRequest() => authService.logout();
}
