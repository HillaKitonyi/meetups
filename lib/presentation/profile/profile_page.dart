import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meetups/logic/navigation/nav_model.dart';
import 'package:meetups/logic/profile/profile_page_model.dart';
import 'package:meetups/logic/profile/profile_page_state.dart';
import 'package:meetups/presentation/core/drawer_navigation_item.dart';
import 'package:meetups/presentation/core/fade_in_page_builder.dart';
import 'package:meetups/presentation/profile/widgets.dart';
import 'package:meetups/presentation/sign_in/widgets.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(profilePageModelProvider);
    final modelNotifier = ref.read(profilePageModelProvider.notifier);

    ref.listen(profilePageModelProvider, (ProfilePageState state) {
      if (state.authFailureOrSuccess == null) return;
      state.authFailureOrSuccess!.fold(
        (f) => modelNotifier.displayErrorSnackbar(context, f.message),
        (_) => modelNotifier.displaySuccessSnackbar(context, 'Profile Updated Successfully!'),
      );
    });

    return WillPopScope(
      onWillPop: () async {
        ref.read(navModelProvider.notifier).onNavigate(context, DrawerItem.home);
        return false;
      },
      child: FadeInPagebuilder(
        child: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              Loader(loading: pageState.loading),
              const SizedBox(height: 32),
              Text(
                pageState.username.toUpperCase(),
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w300, letterSpacing: 1),
              ),
              const SizedBox(height: 20),
              const ProfileImage(),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {
                  ref.read(profilePageModelProvider.notifier).onPickImage(ImageSource.gallery);
                },
                child: const Text(
                  'CHANGE PROFILE PHOTO',
                  style: TextStyle(letterSpacing: 1, fontSize: 18),
                ),
              ),
              const SizedBox(height: 10),
              const ProfileForm(),
            ]),
          ),
        ),
      ),
    );
  }
}
