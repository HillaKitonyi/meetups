import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meetups/domain/core/value_validators.dart';
import 'package:meetups/domain/firestore/meetup_category.dart';
import 'package:meetups/logic/organize_meetup/organize_meetup_page_model.dart';
import 'package:transparent_image/transparent_image.dart';

class TitleTextField extends ConsumerWidget {
  const TitleTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String title = ref.watch(organizeMeetupModelProvider.select((state) => state.title));
    return TextFormField(
      maxLength: 50,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.title),
        labelText: 'Title',
        hintText: title,
      ),
      onChanged: ref.read(organizeMeetupModelProvider.notifier).meetupTitleChanged,
      validator: (_) {
        final titleStr = ref.read(organizeMeetupModelProvider).title;
        return validateNotEmpty(titleStr).flatMap((a) => validateMaxLength(a, 50)).fold(
              (failure) => failure.message,
              (_) => null,
            );
      },
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
      maxLength: 200,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        labelText: 'Description',
        hintText: description,
      ),
      onChanged: ref.read(organizeMeetupModelProvider.notifier).meetupDescriptionChanged,
      validator: (_) {
        final descriptionStr = ref.read(organizeMeetupModelProvider).description;
        return validateNotEmpty(descriptionStr).flatMap((a) => validateMaxLength(a, 200)).fold(
              (failure) => failure.message,
              (_) => null,
            );
      },
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
      maxLength: 30,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.location_pin),
        labelText: 'Location',
        hintText: location,
      ),
      onChanged: ref.read(organizeMeetupModelProvider.notifier).meetupLocationChanged,
      validator: (_) {
        final locationStr = ref.read(organizeMeetupModelProvider).location;
        return validateNotEmpty(locationStr).flatMap((a) => validateMaxLength(a, 30)).fold(
              (failure) => failure.message,
              (_) => null,
            );
      },
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
