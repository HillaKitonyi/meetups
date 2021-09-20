import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:meetups/domain/firestore/meetup.dart';
import 'package:meetups/domain/firestore/meetup_category.dart';
import 'package:meetups/infrastructure/fire_auth_service.dart';
import 'package:meetups/logic/navigation/nav_model.dart';
import 'package:meetups/logic/organize_meetup/organize_meetup_page_model.dart';
import 'package:meetups/logic/organize_meetup/organize_meetup_page_state.dart';
import 'package:meetups/presentation/core/drawer_navigation_item.dart';
import 'package:meetups/presentation/core/fade_in_page_builder.dart';
import 'package:meetups/presentation/organize_meetup/widgets.dart';
import 'package:meetups/presentation/sign_in/widgets.dart';
import 'package:transparent_image/transparent_image.dart';

class OrganizeMeetupsPage extends ConsumerWidget {
  const OrganizeMeetupsPage({Key? key}) : super(key: key);

  static Widget createWithMeetup(Meetup meetup) {
    return ProviderScope(
      overrides: [
        organizeMeetupModelProvider.overrideWithValue(
          OrganizeMeetupPageModel(OrganizeMeetupPageState.fromMeetup(meetup)),
        ),
      ],
      child: const OrganizeMeetupsPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelNotifier = ref.read(organizeMeetupModelProvider.notifier);
    final _formKey = ref.watch(organizeMeetupModelProvider.select((state) => state.formKey));
    final showErrors = ref.watch(organizeMeetupModelProvider.select((state) => state.showErrors));
    final bool loading = ref.watch(organizeMeetupModelProvider.select((state) => state.loading));
    final DateTime date = ref.watch(organizeMeetupModelProvider.select((state) => state.date));
    final TimeOfDay time = ref.watch(
      organizeMeetupModelProvider.select((state) => state.timeOfDay),
    );
    final String? photoURL = ref.watch(
      organizeMeetupModelProvider.select((state) => state.photoURL),
    );
    final bool isEditing = ref.watch(
      organizeMeetupModelProvider.select((state) => state.isEditing),
    );
    final uid = ref.read(appUserProvider).uid;

    return WillPopScope(
      onWillPop: () async {
        ref.read(organizeMeetupModelProvider.notifier).onReset();
        ref.read(navModelProvider.notifier).onNavigate(context, DrawerItem.home);
        return false;
      },
      child: FadeInPagebuilder(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Form(
            key: _formKey,
            autovalidateMode: showErrors ? AutovalidateMode.always : AutovalidateMode.disabled,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Center(
                child: Column(children: [
                  Loader(loading: loading),
                  const SizedBox(height: 16),
                  const TitleTextField(),
                  const SizedBox(height: 4),
                  CategoryPicker(
                    onPickCategory: modelNotifier.meetupCategoryChanged,
                  ),
                  MeetupImage(photoURL: photoURL),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      elevation: 0,
                      primary: Colors.green[500],
                      padding: const EdgeInsets.all(12),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                    child: const Text('Upload an image', style: TextStyle(letterSpacing: 1)),
                    onPressed: () => modelNotifier.showImageSourceModalBottomSheet(context),
                  ),
                  const SizedBox(height: 20),
                  const DescriptionTextField(),
                  const SizedBox(height: 8),
                  const LocationTextField(),
                  const SizedBox(height: 8),
                  DateTextField(
                    controller: TextEditingController()
                      ..value = TextEditingValue(text: DateFormat('d MMM, yyyy').format(date)),
                  ),
                  const SizedBox(height: 8),
                  TimeTextField(
                    controller: TextEditingController()
                      ..value = TextEditingValue(text: time.format(context)),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(
                      isEditing ? 'SAVE' : 'CREATE',
                      style: const TextStyle(letterSpacing: 1, fontSize: 18),
                    ),
                    onPressed: () => modelNotifier.onSubmitClicked(uid),
                  ),
                  const SizedBox(height: 18),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
