import 'package:flutter/material.dart';
import 'package:ows_events_mobile/common_widgets/info_icon_button.dart';
import 'package:ows_events_mobile/common_widgets/logo.dart';
import 'package:ows_events_mobile/features/events/presentation/events_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallSizeScreen = screenSize.width <= 500;

    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Center(
        child: SizedBox(
          width: isSmallSizeScreen ? double.infinity : 500,
          child: Scaffold(
            appBar: AppBar(
              leading: const Logo(),
              leadingWidth: 150,
              actions: const [
                Text("30 дней"),
                InfoIconButton(),
              ],
            ),
            body: const EventsScreen(),
          ),
        ),
      ),
    );
  }
}
