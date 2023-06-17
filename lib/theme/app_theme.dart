import 'package:flutter/material.dart';

class AppTheme {
  static const double maxContainerWidth = 500;

  static ThemeData get theme => ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      );
}
