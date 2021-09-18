import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final Future<bool> Function()? onBackPressed;
  const HomePage({Key? key, this.onBackPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center();
  }
}
