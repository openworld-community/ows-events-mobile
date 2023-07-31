import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/common_widgets/max_width_container.dart';
import 'package:ows_events_mobile/features/events/presentation/events_list.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const MaxWidthContainer(
      child: Scaffold(
        body: EventsList(),
      ),
    );
  }
}
