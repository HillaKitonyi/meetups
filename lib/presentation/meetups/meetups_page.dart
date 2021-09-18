import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetups/logic/navigation/nav_model.dart';
import 'package:meetups/presentation/core/drawer_navigation_item.dart';

class MeetupsPage extends ConsumerWidget {
  const MeetupsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(navModelProvider);
    return WillPopScope(
      onWillPop: () async {
        ref.read(navModelProvider.notifier).onNavigate(context, DrawerItem.home);
        return false;
      },
      child: Container(),
    );
  }
}
