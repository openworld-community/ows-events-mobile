import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/common_widgets/custom_app_bar.dart';
import 'package:ows_events_mobile/features/events/presentation/events_list.dart';

class EventsScreen extends ConsumerWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'eventsScreenTitle'.tr(),
        withFilters: true,
        onSearch: _onSearch,
      ),
      body: const EventsList(),
    );
  }

  void _onSearch(String query) {
    // TODO добавить сохранение строки поиска в провайдер
    throw UnimplementedError();
  }
}
