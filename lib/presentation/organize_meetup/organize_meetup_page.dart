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
    );
  }
}

class TitleTextField extends ConsumerWidget {
  const TitleTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String title = ref.watch(organizeMeetupModelProvider.select((state) => state.title));
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.title),
        labelText: 'Title',
        hintText: title,
      ),
      onChanged: ref.read(organizeMeetupModelProvider.notifier).meetupTitleChanged,
      // validator: (_) {/* TODO: validateEmpty and validateMaxLength */},
    );
  }
}

class MeetupImage extends StatelessWidget {
  final String? photoURL;
  const MeetupImage({Key? key, this.photoURL}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final imageHeight = 0.3 * screenSize.height;
    final imageWidth = 0.9 * screenSize.width;

    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: photoURL == null
          ? SvgPicture.asset(
              'assets/undraw_eating_together.svg',
              fit: BoxFit.fitWidth,
              height: imageHeight,
              width: imageWidth,
            )
          : photoURL!.contains('http')
              ? FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: photoURL!,
                  height: imageHeight,
                  width: imageWidth,
                  fit: BoxFit.fitWidth,
                )
              : photoURL!.contains('assets')
                  ? Image.asset(
                      photoURL!,
                      fit: BoxFit.fitHeight,
                      height: imageHeight,
                      width: imageWidth,
                    )
                  : Image.file(
                      File(photoURL!),
                      fit: BoxFit.fitWidth,
                      height: imageHeight,
                      width: imageWidth,
                    ),
    );
  }
}

class CategoryPicker extends StatelessWidget {
  final ValueChanged<MeetupCategory> onPickCategory;
  const CategoryPicker({Key? key, required this.onPickCategory}) : super(key: key);

  static final List<DropdownMenuItem<MeetupCategory>> _dropDownItems = MeetupCategory.values
      .map((category) => DropdownMenuItem(child: Text(category.asString()), value: category))
      .toList();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      visualDensity: VisualDensity.comfortable,
      leading: const Text('Pick a category for the meetup'),
      title: DropdownButtonFormField<MeetupCategory>(
        decoration: const InputDecoration(border: UnderlineInputBorder()),
        items: _dropDownItems,
        value: MeetupCategory.general,
        isDense: true,
        onChanged: (category) => category != null ? onPickCategory(category) : null,
      ),
    );
  }
}

class DescriptionTextField extends ConsumerWidget {
  const DescriptionTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final description = ref.watch(organizeMeetupModelProvider.select((state) => state.description));
    return TextFormField(
      maxLines: 5,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        labelText: 'Description',
        hintText: description,
      ),
      onChanged: ref.read(organizeMeetupModelProvider.notifier).meetupDescriptionChanged,
      // validator: (_) {/* TODO: validateEmpty and validateMaxLength */},
    );
  }
}

class LocationTextField extends ConsumerWidget {
  const LocationTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String location = ref.watch(
      organizeMeetupModelProvider.select((state) => state.location),
    );
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.location_pin),
        labelText: 'Location',
        hintText: location,
      ),
      onChanged: ref.read(organizeMeetupModelProvider.notifier).meetupLocationChanged,
      // validator: (_) {/* TODO: validateEmpty and validateMaxLength */},
    );
  }
}

class DateTextField extends ConsumerWidget {
  final TextEditingController controller;
  const DateTextField({required this.controller, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      controller: controller,
      onTap: () async {
        FocusScope.of(context).requestFocus(FocusNode());
        final pickedDate = await _pickTime(context);
        ref.read(organizeMeetupModelProvider.notifier).meetupDateChanged(pickedDate);
      },
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.calendar_today_outlined),
        labelText: 'Date',
      ),
    );
  }

  Future<DateTime?> _pickTime(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 5),
    );
  }
}

class TimeTextField extends ConsumerWidget {
  final TextEditingController controller;
  const TimeTextField({required this.controller, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      controller: controller,
      onTap: () async {
        FocusScope.of(context).requestFocus(FocusNode());
        final pickedTime = await _pickTime(context);
        ref.read(organizeMeetupModelProvider.notifier).meetupTimeChanged(pickedTime);
      },
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.access_time_filled),
        labelText: 'Time',
      ),
    );
  }

  Future<TimeOfDay?> _pickTime(BuildContext context) => showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
}
