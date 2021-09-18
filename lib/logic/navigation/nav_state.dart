import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meetups/presentation/core/drawer_navigation_item.dart';

part 'nav_state.freezed.dart';

@freezed
abstract class NavState with _$NavState {
  const factory NavState({required DrawerItem drawerItem}) = _NavState;

  factory NavState.initial() => const NavState(drawerItem: DrawerItem.home);
}
