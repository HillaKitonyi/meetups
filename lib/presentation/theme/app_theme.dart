import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData makeDefault() {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.grey[200],
      dividerColor: Colors.black54,
      primaryColor: Colors.red[300],
      errorColor: const Color.fromRGBO(13, 0, 0, 1),
      appBarTheme: const AppBarTheme(centerTitle: true),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
        errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        errorStyle: TextStyle(color: Colors.red[700]!),
      ),
      colorScheme: ColorScheme.light(primary: Colors.red[300]!),
    );
  }
}
