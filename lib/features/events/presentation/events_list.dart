import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/common_widgets/events_list_item.dart';
import 'package:ows_events_mobile/common_widgets/offline_message.dart';
import 'package:ows_events_mobile/common_widgets/refresh_indicator.dart';
import 'package:ows_events_mobile/core/location_provider.dart';
import 'package:ows_events_mobile/features/event/presentation/event_screen.dart';
import 'package:ows_events_mobile/features/events/domain/event.dart';
import 'package:ows_events_mobile/features/events/presentation/events_filters.dart';
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
    final AsyncValue<String> location =
        isMobile ? ref.watch(locationProvider) : const AsyncValue.data('');

    return asyncEventsListData.when(
      data: (events) {
        final bool connectionError = controller.connectionError;
        String? offlineMessage;

        if (connectionError == true) {
          final String saveDateTime =
              TimeUtils.formatDateTime(controller.saveDataTime);
          offlineMessage = '${"offlineDataMessage".tr()} $saveDateTime';
        }
        return Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (offlineMessage != null)
                  OfflineMessage(
                    message: offlineMessage,
                  ),
                isMobile && location.value != null
                    ? Center(
                        child: Text(
                          '${location.value}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      )
                    : const SizedBox(),
                SizedBox(height: isMobile ? 10 : 0),
                Expanded(
                  child: AppRefreshIndicator(
                    onRefresh: () async {
                      ref.invalidate(eventsListControllerProvider);
                    },
                    child: ListView.builder(
                      itemCount: events.length,
                      itemBuilder: (context, index) {
                        final Event event = events[index].event;
                        final bool favoriteMark = events[index].favoriteMark;

                        return EventsListItem(
                          eventData: event,
                          favorite: favoriteMark,
                          locationLinkAction: () {
                            // TODO: реализовать клик по месту проведения
                            throw UnimplementedError();
                          },
                          itemAction: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EventScreen(
                                id: event.id,
                              ),
                            ));
                          },
                          onAddToFavorite: () {
                            controller.toggleEventToFavorites(event.id);
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              child: EventsFilters(
                onSearchTextChanged: (value) {
                  // TODO: добавить реализацию поиска по списку событий.
                  throw UnimplementedError();
                },
                onCityTextChanged: (value) {
                  // TODO: добавить реализацию фильтрации по городу.
                  throw UnimplementedError();
                },
              ),
            )
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
