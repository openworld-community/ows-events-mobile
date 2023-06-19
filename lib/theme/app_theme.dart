import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme => ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xff48C78E)
        )
            .copyWith(
          primary: const Color(0xff48C78E),
          primaryContainer: const Color(0xff21A86B),
          secondary: Colors.white,
          secondaryContainer: const Color(0xffDBDBDB),
          error: const Color(0xffDB9758),
        ),
        useMaterial3: true,
      ).copyWith(
    focusColor: const Color(0xff21A86B),
    disabledColor: const Color(0xff48C78E),
    dividerColor: const Color(0xffC3C3C3),
  );
}
