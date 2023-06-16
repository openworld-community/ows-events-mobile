import 'package:flutter/material.dart';
import 'package:ows_events_mobile/features/events/presentation/events_screen.dart';
import 'package:ows_events_mobile/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Afisha Peredelano',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const EventsScreen(),
    );
  }
}
