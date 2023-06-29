import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/common_widgets/offline_message.dart';
import 'package:ows_events_mobile/common_widgets/refresh_indicator.dart';
import 'package:ows_events_mobile/features/event/presentation/event_screen.dart';
import 'package:ows_events_mobile/features/events/domain/event.dart';
import 'package:ows_events_mobile/common_widgets/events_list_item.dart';
import 'package:ows_events_mobile/features/favorite_events/domain/event_with_favorite_mark.dart';
import 'package:ows_events_mobile/features/favorite_events/presentation/favorite_events_list_controller.dart';
import 'package:ows_events_mobile/util/time_utils.dart';

class FavoriteEventsList extends ConsumerWidget {
  const FavoriteEventsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<EventWithFavoriteMark>> asyncEventListData =
        ref.watch(favoriteEventsListControllerProvider);
    final FavoriteEventsListController controller =
        ref.read(favoriteEventsListControllerProvider.notifier);

    return asyncEventListData.when(
      data: (events) {
        final bool connectionError = controller.connectionError;
        String? offlineMessage;
        if (connectionError) {
          final String saveDateTime =
              TimeUtils.formatDateTime(controller.saveDataTime);
          offlineMessage = 'Оффлайн данные. Актуальны на момент $saveDateTime';
        }
        return Column(
          children: [
            if (offlineMessage != null)
              OfflineMessage(
                message: offlineMessage,
              ),
            Expanded(
              child: AppRefreshIndicator(
                onRefresh: () async {
                  ref.invalidate(favoriteEventsListControllerProvider);
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
                            eventData: event,
                          ),
                        ));
                      },
                      onAddToFavorite: () {
                        // TODO: Добавить диалог для подверждения удаления из избранного
                        throw UnimplementedError();
                      },
                    );
                  },
                ),
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
