import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ows_events_mobile/common_widgets/custom_app_bar.dart';
import 'package:ows_events_mobile/features/favorite_events/presentation/favorite_events_list.dart';

class FavoriteEventsScreen extends StatelessWidget {
  const FavoriteEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "favoriteEventsScreenTitle".tr(),
      ),
      body: const FavoriteEventsList(),
    );
  }
}
