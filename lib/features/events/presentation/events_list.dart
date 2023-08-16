import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ows_events_mobile/common_widgets/events_list_item.dart';
import 'package:ows_events_mobile/common_widgets/offline_message.dart';
import 'package:ows_events_mobile/common_widgets/refresh_indicator.dart';
import 'package:ows_events_mobile/core/current_location_provider.dart';
import 'package:ows_events_mobile/features/events/data/filters_providers.dart';
import 'package:ows_events_mobile/features/events/domain/event.dart';
import 'package:ows_events_mobile/features/events/presentation/events_list_controller.dart';
import 'package:ows_events_mobile/features/favorite_events/domain/event_with_favorite_mark.dart';
import 'package:ows_events_mobile/util/time_utils.dart';
import 'package:universal_platform/universal_platform.dart';

class EventsList extends ConsumerWidget {
  const EventsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = UniversalPlatform.isAndroid || UniversalPlatform.isIOS;
    final AsyncValue<List<EventWithFavoriteMark>> asyncEventsListData =
        ref.watch(eventsListControllerProvider);
    final EventsListController controller =
        ref.read(eventsListControllerProvider.notifier);
    final AsyncValue<String> location = isMobile
        ? ref.watch(currentLocationProvider)
        : const AsyncValue.data('');

    return asyncEventsListData.when(
      data: (events) {
        final List<EventWithFavoriteMark> filteredEvents = controller.filter(
          events,
          ref.watch(selectedCountryProvider),
          ref.watch(selectedCityProvider),
          ref.watch(selectedDatesProvider),
        );

        final bool connectionError = controller.connectionError;
        String? offlineMessage;

        if (connectionError == true) {
          final String saveDateTime =
              TimeUtils.formatDateTime(controller.saveDataTime);
          offlineMessage = '${"offlineDataMessage".tr()} $saveDateTime';
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (offlineMessage != null)
              OfflineMessage(
                message: offlineMessage,
              ),
            if (isMobile && location.value != null)
              Center(
                child: Text(
                  '${location.value}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            SizedBox(height: isMobile ? 10 : 0),
            Expanded(
              child: AppRefreshIndicator(
                onRefresh: () async {
                  ref.invalidate(eventsListControllerProvider);
                },
                child: filteredEvents.isNotEmpty
                    ? ListView.builder(
                        itemCount: filteredEvents.length,
                        itemBuilder: (context, index) {
                          final Event event = filteredEvents[index].event;
                          final bool favoriteMark =
                              filteredEvents[index].favoriteMark;

                          return EventsListItem(
                            eventData: event,
                            favorite: favoriteMark,
                            locationLinkAction: () {
                              // TODO: реализовать клик по месту проведения
                              throw UnimplementedError();
                            },
                            itemAction: () {
                              chosenEventIDProvider.overrideWithValue(event.id);
                              context.go('/events/${event.id}');
                            },
                            onAddToFavorite: () {
                              controller.toggleEventToFavorites(event.id);
                            },
                          );
                        },
                      )
                    : Center(child: Text('eventsNotFound'.tr())),
              ),
            ),
          ],
        );
      },
      // TODO: в дальнейшем заменить на виджет для вывода ошибки
      error: (error, _) => Text(error.toString()),
      loading: () => const Align(
        alignment: Alignment.topCenter,
        child: LinearProgressIndicator(),
      ),
    );
  }
}

final chosenEventIDProvider = Provider((ref) => '');
