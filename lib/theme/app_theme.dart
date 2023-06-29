import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getTheme(BuildContext context) {
    final inputDecorationTheme = InputDecorationTheme(
      isDense: true,
      filled: true,
      fillColor: Theme.of(context).colorScheme.surfaceVariant,
    );
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xff48C78E),
      ).copyWith(
        primary: const Color(0xff48C78E),
        primaryContainer: const Color(0xff21A86B),
        secondaryContainer: const Color(0xffDBDBDB),
        surfaceVariant: Colors.white,
      ),
      inputDecorationTheme: inputDecorationTheme.copyWith(
        contentPadding: const EdgeInsets.fromLTRB(15, 12, 12, 12),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: inputDecorationTheme.copyWith(
          constraints: const BoxConstraints(
            maxHeight: 40,
          ),
        ),
      ),
      useMaterial3: true,
    ).copyWith(
      focusColor: const Color(0xff21A86B),
      disabledColor: const Color(0xff48C78E),
      dividerColor: const Color(0xffC3C3C3),
    );
  }

  static Color green1 = const Color(0xff48C78E);
  static Color green2 = const Color(0xff21A86B);
  static Color gray1 = const Color(0xffDBDBDB);
  static Color gray2 = const Color(0xffC3C3C3);
  static Color blue1 = const Color(0xff5c9ad2);
  static const double maxContainerWidth = 500;
}
