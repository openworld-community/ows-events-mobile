import 'package:flutter/material.dart';

class AppTheme {
  static const double padding = 15;
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
        primaryContainer: Colors.white,
        secondary: const Color(0xff546FEF),
        secondaryContainer: Colors.white,
        surfaceVariant: gray1,
        background: Colors.white,
        surface: Colors.white,
      ),
      textTheme: Theme.of(context).textTheme.copyWith(
            labelLarge: const TextStyle(
              fontSize: 14,
            ),
            bodyMedium: const TextStyle(
              fontSize: 17,
            ),
          ),
      inputDecorationTheme: inputDecorationTheme.copyWith(
        contentPadding: const EdgeInsets.fromLTRB(15, 12, 12, 12),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: inputDecorationTheme.copyWith(
          constraints: const BoxConstraints(
            maxHeight: 40,
            minWidth: 50,
            maxWidth: 150,
          ),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          fixedSize: const MaterialStatePropertyAll(Size(40, 40)),
          backgroundColor: MaterialStatePropertyAll(Colors.grey[200]),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStatePropertyAll(EdgeInsets.zero),
          minimumSize: MaterialStatePropertyAll(Size(10, 10)),
          overlayColor: MaterialStatePropertyAll(Colors.transparent),
        ),
      ),
      cardTheme: const CardTheme(
        color: Colors.white,
        elevation: 0,
        margin: EdgeInsets.zero,
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
