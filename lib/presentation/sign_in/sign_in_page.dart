import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetups/logic/sign_in/sign_in_model.dart';
import 'package:meetups/logic/sign_in/sign_in_state.dart';
import 'package:meetups/presentation/sign_in/widgets.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(signInModelProvider, (SignInPageState state) {
      if (state.authFailureOrSuccess == null) return;
      state.authFailureOrSuccess!.fold(
        (f) => _showErrorSnackbar(context, f.message),
        (_) {},
      );
    });
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'SIGN IN / SIGN UP',
          style: TextStyle(letterSpacing: 1, color: Colors.black45),
        ),
      ),
      body: const SignInForm(),
    );
  }

  void _showErrorSnackbar(BuildContext context, String message) {
    FlushbarHelper.createError(message: message, duration: const Duration(seconds: 5));
  }
}
