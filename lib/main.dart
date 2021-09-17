import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetups/logic/app_provider_observer.dart';
import 'package:meetups/presentation/sign_in/sign_in_page.dart';
import 'package:meetups/presentation/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(
    observers: [AppProviderObserver()],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meetups',
      theme: AppTheme.makeDefault(),
      home: Scaffold(
        appBar: AppBar(title: const Text('Sign In Form'), centerTitle: true),
        body: const SignInPage(),
      ),
    );
  }
}
