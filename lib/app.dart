import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ows_events_mobile/features/main/presentation/main_screen.dart';
import 'package:ows_events_mobile/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Afisha Peredelano',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getTheme(context),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const MainScreen(),
    );
  }
}
