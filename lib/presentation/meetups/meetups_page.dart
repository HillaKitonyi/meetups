import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetups/infrastructure/fire_store_service.dart';
import 'package:meetups/logic/navigation/nav_model.dart';
import 'package:meetups/presentation/core/drawer_navigation_item.dart';
import 'package:meetups/presentation/meetups/widgets.dart';

class MeetupsPage extends ConsumerWidget {
  const MeetupsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meetupsListStream = ref.watch(meetupsListProvider);
    return WillPopScope(
      onWillPop: () async {
        ref.read(navModelProvider.notifier).onNavigate(context, DrawerItem.home);
        return false;
      },
      child: Center(
        child: meetupsListStream.maybeWhen(
          data: (meetupsList) =>
              meetupsList.isEmpty ? const NoResultsPage() : MeetupsList(meetupsList: meetupsList),
          orElse: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
