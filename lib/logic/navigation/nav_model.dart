import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetups/logic/navigation/nav_state.dart';
import 'package:meetups/presentation/core/drawer_navigation_item.dart';

final navModelProvider = StateNotifierProvider<NavModel, NavState>((ref) {
  return NavModel(ref);
}, name: 'navModelProvider');

class NavModel extends StateNotifier<NavState> {
  final ProviderRefBase ref;
  NavModel(this.ref) : super(NavState.initial());

  void onNavigate(BuildContext context, DrawerItem drawerItem) {
    final drawerIsOpen = Scaffold.of(context).isDrawerOpen;
    if (drawerIsOpen) Navigator.pop(context);

    state = NavState(drawerItem: drawerItem);
  }
}
