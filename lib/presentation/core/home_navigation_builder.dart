import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meetups/domain/auth/app_user.dart';
import 'package:meetups/infrastructure/fire_auth_service.dart';
import 'package:meetups/logic/home/home_page_model.dart';
import 'package:transparent_image/transparent_image.dart';

import 'drawer_navigation_item.dart';

class HomeNavigationBuilder extends StatefulWidget {
  final Widget Function(
    BuildContext context,
    DrawerItem drawerItem,
    Future<bool> Function() onBackPressed,
  ) builder;
  const HomeNavigationBuilder({Key? key, required this.builder}) : super(key: key);

  static Widget create(AppUser appUser) {
    return ProviderScope(
      overrides: [appUserProvider.overrideWithValue(appUser)],
      child: HomeNavigationBuilder(builder: (context, drawerItem, onBackPressed) {
        return WillPopScope(
          child: drawerItem.buildPage(onBackPressed),
          onWillPop: onBackPressed,
        );
      }),
    );
  }

  @override
  _HomeNavigationBuilder2State createState() => _HomeNavigationBuilder2State();
}

class _HomeNavigationBuilder2State extends State<HomeNavigationBuilder> {
  DrawerItem drawerItem = DrawerItem.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(drawerItem.title),
      ),
      body: widget.builder(
        context,
        drawerItem,
        () async {
          setState(() => drawerItem = DrawerItem.home);
          return false;
        },
      ),
      drawer: Builder(builder: (context) {
        return _AppDrawer(
          selectedDrawerItem: drawerItem,
          onSelectDrawerItem: (value) {
            if (Scaffold.of(context).isDrawerOpen) Navigator.pop(context);
            setState(() => drawerItem = value);
          },
        );
      }),
    );
  }
}

class _AppDrawer extends ConsumerWidget {
  final DrawerItem selectedDrawerItem;
  final ValueChanged<DrawerItem> onSelectDrawerItem;

  const _AppDrawer({
    Key? key,
    required this.selectedDrawerItem,
    required this.onSelectDrawerItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: DecoratedBox(
        decoration: BoxDecoration(color: Theme.of(context).primaryColor.withOpacity(0.2)),
        child: ListView(
          shrinkWrap: true,
          children: [
            const Padding(padding: EdgeInsets.symmetric(vertical: 32), child: _DrawerHeader()),
            ListTile(
              selected: selectedDrawerItem == DrawerItem.home,
              selectedTileColor: Theme.of(context).scaffoldBackgroundColor,
              leading: const Icon(Icons.home_rounded),
              title: const Text('Home'),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () => onSelectDrawerItem(DrawerItem.home),
            ),
            ListTile(
              selected: selectedDrawerItem == DrawerItem.viewMeetups,
              selectedTileColor: Theme.of(context).scaffoldBackgroundColor,
              leading: const Icon(Icons.supervisor_account_rounded),
              title: const Text('View Meetups'),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () => onSelectDrawerItem(DrawerItem.viewMeetups),
            ),
            ListTile(
              selected: selectedDrawerItem == DrawerItem.organizeMeetups,
              selectedTileColor: Theme.of(context).scaffoldBackgroundColor,
              leading: const Icon(Icons.perm_contact_calendar_sharp),
              title: const Text('Organize Meetup'),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () => onSelectDrawerItem(DrawerItem.organizeMeetups),
            ),
            ListTile(
              selected: selectedDrawerItem == DrawerItem.profile,
              selectedTileColor: Theme.of(context).scaffoldBackgroundColor,
              leading: const Icon(Icons.person_rounded),
              title: const Text('Profile'),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () => onSelectDrawerItem(DrawerItem.profile),
            ),
            ListTile(
              selected: selectedDrawerItem == DrawerItem.logout,
              selectedTileColor: Theme.of(context).scaffoldBackgroundColor,
              leading: const Icon(Icons.logout_rounded),
              title: const Text('Log out'),
              onTap: () {
                onSelectDrawerItem(DrawerItem.home);
                ref.read(homePageModelProvider.notifier).onLogoutRequest();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerHeader extends ConsumerWidget {
  const _DrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appUser = ref.watch(appUserProvider);
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: appUser.photoURL == null
                  ? SvgPicture.asset('assets/man.svg', height: 60)
                  : FadeInImage.memoryNetwork(
                      fit: BoxFit.cover,
                      height: 60,
                      width: 60,
                      placeholder: kTransparentImage,
                      image: appUser.photoURL!,
                    ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appUser.username.toUpperCase(),
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 24, letterSpacing: 1),
              ),
              const SizedBox(height: 16),
              Text(appUser.email, overflow: TextOverflow.fade),
            ],
          ),
        ),
      ],
    );
  }
}
