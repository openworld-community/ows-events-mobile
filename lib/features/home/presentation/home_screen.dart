import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/features/events/presentation/events_list.dart';
import 'package:ows_events_mobile/features/home/presentation/home_app_bar.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: HomeAppBar(),
      body: EventsList(),
    );
  }
}
