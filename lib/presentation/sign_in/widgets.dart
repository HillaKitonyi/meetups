import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meetups/domain/core/value_validators.dart';
import 'package:meetups/logic/sign_in/sign_in_model.dart';

class SignInForm extends ConsumerWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.of(context).size.height;
    final modelNotifier = ref.read(signInModelProvider.notifier);
    final bool showErrors = ref.watch(signInModelProvider.select((state) => state.showErrors));
    final bool loading = ref.watch(signInModelProvider.select((state) => state.loading));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        autovalidateMode: showErrors ? AutovalidateMode.always : AutovalidateMode.disabled,
        child: ListView(
          children: [
            Loader(loading: loading),
            SizedBox(height: screenHeight * 0.07),
            SvgPicture.asset('assets/undraw_fill_form.svg', height: 200),
            SizedBox(height: screenHeight * 0.07),
            const _EmailTextField(),
            SizedBox(height: screenHeight * 0.01),
            const _PasswordTextField(),
            SizedBox(height: screenHeight * 0.01),
            _ButtonRow(
              loading: loading,
              onLoginPressed: modelNotifier.loginButtonPressed,
              onRegisterPressed: modelNotifier.registerButtonPressed,
            ),
            const _OrWidget(),
            _GoogleButton(
              loading: loading,
              onGoogleSignIn: modelNotifier.googleButtonPressed,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _EmailTextField extends ConsumerWidget {
  const _EmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelNotifier = ref.read(signInModelProvider.notifier);
    return TextFormField(
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.email_rounded),
        labelText: 'Email',
      ),
      onChanged: modelNotifier.emailChanged,
      validator: (_) {
        final email = ref.read(signInModelProvider).email;
        return validateEmail(email).fold((f) => f.message, (_) => null);
      },
    );
  }
}

class _PasswordTextField extends ConsumerWidget {
  const _PasswordTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelNotifier = ref.read(signInModelProvider.notifier);
    final _obscureText = ref.watch(signInModelProvider.select((state) => !state.showPassword));
    return TextFormField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key_rounded),
        labelText: 'Password',
        suffixIcon: IconButton(
          onPressed: modelNotifier.showPasswordToggled,
          icon: Icon(_obscureText ? Icons.visibility_off_rounded : Icons.visibility_rounded),
        ),
      ),
      onChanged: modelNotifier.passwordChanged,
      validator: (_) {
        final password = ref.read(signInModelProvider).password;
        return validatePassword(password).fold((f) => f.message, (_) => null);
      },
    );
  }
}

class _ButtonRow extends StatelessWidget {
  final bool loading;
  final VoidCallback? onLoginPressed;
  final VoidCallback? onRegisterPressed;
  const _ButtonRow({
    Key? key,
    required this.loading,
    this.onLoginPressed,
    this.onRegisterPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      textStyle: MaterialStateProperty.all(const TextStyle(letterSpacing: 1, fontSize: 18)),
      padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
      shape: MaterialStateProperty.all(
        const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
    );

    return Row(children: [
      Expanded(
        child: ElevatedButton(
          style: buttonStyle,
          child: const Text('LOGIN'),
          onPressed: loading ? null : onLoginPressed,
        ),
      ),
      const SizedBox(width: 8),
      Expanded(
        child: ElevatedButton(
          style: buttonStyle,
          child: const Text('REGISTER'),
          onPressed: loading ? null : onRegisterPressed,
        ),
      ),
    ]);
  }
}

class _OrWidget extends StatelessWidget {
  const _OrWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      const Divider(height: 50),
      Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: const Text('OR'),
      ),
    ]);
  }
}

class _GoogleButton extends StatelessWidget {
  final bool loading;
  final VoidCallback? onGoogleSignIn;
  const _GoogleButton({
    Key? key,
    required this.loading,
    this.onGoogleSignIn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.all(14),
        primary: Colors.green,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
      onPressed: loading ? null : onGoogleSignIn,
      child: const Text('SIGN IN WITH GOOGLE', style: TextStyle(fontSize: 18, letterSpacing: 1)),
    );
  }
}

class Loader extends StatelessWidget {
  final bool loading;
  const Loader({Key? key, required this.loading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 4,
      child: loading
          ? LinearProgressIndicator(backgroundColor: Theme.of(context).scaffoldBackgroundColor)
          : null,
    );
  }
}
