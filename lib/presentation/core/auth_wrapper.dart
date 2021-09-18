import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetups/infrastructure/fire_auth_service.dart';
import 'package:meetups/presentation/core/home_navigation_builder.dart';
import 'package:meetups/presentation/sign_in/sign_in_page.dart';

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStream = ref.watch(appUserStreamProvider);
    return authStream.when(
      data: (appUserOption) => appUserOption.fold(
        () => const SignInPage(),
        (appUser) => HomeNavigationBuilder.create(appUser),
      ),
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text(e.toString()))),
    );
  }
}
