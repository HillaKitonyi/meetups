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

  Widget buildPage() {
    switch (this) {
      case DrawerItem.home:
        return const HomePage();
      case DrawerItem.viewMeetups:
        return const MeetupsPage();
      case DrawerItem.organizeMeetups:
        return const OrganizeMeetupsPage();
      case DrawerItem.profile:
        return const ProfilePage();
      default:
        return const HomePage();
    }
  }
}
