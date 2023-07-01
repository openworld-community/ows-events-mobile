import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/common_widgets/events_list_item.dart';
import 'package:ows_events_mobile/common_widgets/refresh_indicator.dart';
import 'package:ows_events_mobile/features/event/presentation/event_screen.dart';
import 'package:ows_events_mobile/features/events/domain/event.dart';
import 'package:ows_events_mobile/features/favorite_events/domain/event_with_favorite_mark.dart';
import 'package:ows_events_mobile/features/favorite_events/presentation/favorite_events_list_controller.dart';

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
        final favoriteList =
            events.where((element) => element.favoriteMark).toList();

        return Column(
          children: [
            Expanded(
              child: AppRefreshIndicator(
                onRefresh: () async {
                  ref.invalidate(favoriteEventsListControllerProvider);
                },
                child: ListView.builder(
                  itemCount: favoriteList.length,
                  itemBuilder: (context, index) {
                    final Event event = favoriteList[index].event;

                    return EventsListItem(
                      eventData: event,
                      favorite: true,
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
