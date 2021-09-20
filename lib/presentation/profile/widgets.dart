import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meetups/domain/core/value_validators.dart';
import 'package:meetups/infrastructure/fire_auth_service.dart';
import 'package:meetups/logic/profile/profile_page_model.dart';
import 'package:transparent_image/transparent_image.dart';

class ProfileForm extends ConsumerWidget {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(profilePageModelProvider);
    final modelNotifier = ref.read(profilePageModelProvider.notifier);
    final _obscureText = ref.watch(profilePageModelProvider.select((state) => !state.showPassword));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: pageState.email,
                prefixIcon: const Icon(Icons.email_rounded),
              ),
              onChanged: modelNotifier.emailChanged,
              validator: (_) {
                final email = pageState.email;
                return validateEmail(email).fold((failure) => failure.message, (r) => null);
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                labelText: 'Username',
                hintText: pageState.username,
                prefixIcon: const Icon(Icons.person_rounded),
              ),
              onChanged: modelNotifier.usernameChanged,
            ),
            const SizedBox(height: 16),
            TextFormField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.vpn_key_rounded),
                labelText: 'New Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                  ),
                  onPressed: modelNotifier.toggleShowPassword,
                ),
              ),
              onChanged: modelNotifier.passwordChanged,
              validator: (_) {
                final password = pageState.password;
                return validatePassword(password).fold((failure) => failure.message, (r) => null);
              },
            ),
            const SizedBox(height: 16),
            const _ButtonRow(),
          ],
        ),
      ),
    );
  }
}

class _ButtonRow extends ConsumerWidget {
  const _ButtonRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelNotifier = ref.read(profilePageModelProvider.notifier);
    final loading = ref.watch(profilePageModelProvider.select((state) => state.loading));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(elevation: 0),
            child: const Text('CANCEL', style: TextStyle(letterSpacing: 1)),
            onPressed: () => modelNotifier.onCancelPressed(context),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(elevation: 0, primary: Colors.green[300]),
            child: const Text('SAVE', style: TextStyle(letterSpacing: 1)),
            onPressed: loading ? null : modelNotifier.onSubmitPressed,
          ),
        ),
      ],
    );
  }
}

class ProfileImage extends ConsumerWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photoURL = ref.watch(profilePageModelProvider.select((state) => state.photoURL));
    final edited = ref.watch(profilePageModelProvider.select((state) => state.edited));

    return Stack(
      alignment: Alignment.center,
      children: [
        const CircularProgressIndicator(),
        DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              if (photoURL != null)
                const BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(190 / 2),
            child: photoURL == null
                ? SvgPicture.asset('assets/man.svg', height: 190)
                : edited
                    ? Image.file(
                        File(photoURL),
                        height: 190,
                        width: 190,
                        fit: BoxFit.cover,
                      )
                    : FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: photoURL,
                        height: 190,
                        width: 190,
                        fit: BoxFit.cover,
                      ),
          ),
        ),
        if (edited)
          Positioned(
            top: 5,
            right: 5,
            child: FloatingActionButton.small(
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {
                final appUser = ref.read(appUserProvider);
                ref.read(profilePageModelProvider.notifier).revertProfileImage(appUser.photoURL);
              },
              child: Icon(Icons.cancel_outlined, color: Theme.of(context).scaffoldBackgroundColor),
            ),
          ),
      ],
    );
  }
}
