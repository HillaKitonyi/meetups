import 'package:flutter/material.dart';
import 'package:meetups/presentation/home/home_page.dart';
import 'package:meetups/presentation/meetups/meetups_page.dart';
import 'package:meetups/presentation/organize_meetup/organize_meetup_page.dart';
import 'package:meetups/presentation/profile/profile_page.dart';

enum DrawerItem { home, viewMeetups, organizeMeetups, profile, logout }

extension DrawerItemX on DrawerItem {
  String get title {
    switch (this) {
      case DrawerItem.home:
        return 'Home';
      case DrawerItem.viewMeetups:
        return 'View Meetups';
      case DrawerItem.organizeMeetups:
        return 'Organize Meetup';
      case DrawerItem.profile:
        return 'Profile';
      default:
        return 'Home';
    }
  }

  Widget buildPage(Future<bool> Function() onBackPressed) {
    switch (this) {
      case DrawerItem.home:
        return const HomePage();
      case DrawerItem.viewMeetups:
        return MeetupsPage(onbackPressed: onBackPressed);
      case DrawerItem.organizeMeetups:
        return OrganizeMeetupsPage(onbackPressed: onBackPressed);
      case DrawerItem.profile:
        return ProfilePage(onBackPressed: onBackPressed);
      default:
        return const HomePage();
    }
  }
}
