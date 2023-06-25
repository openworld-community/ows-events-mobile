import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/features/event/presentation/event_screen.dart';
import 'package:ows_events_mobile/features/events/domain/event.dart';
import 'package:ows_events_mobile/features/events/presentation/events_filters.dart';
import 'package:ows_events_mobile/features/events/presentation/events_list_controller.dart';
import 'package:ows_events_mobile/features/events/presentation/events_list_item.dart';
import 'package:ows_events_mobile/features/favorite_events/domain/event_with_favorite_mark.dart';
import 'package:ows_events_mobile/common_widgets/refresh_indicator.dart';
import 'package:ows_events_mobile/features/main/presentation/filter_button_provaider.dart';

class EventsList extends ConsumerWidget {
  const EventsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<EventWithFavoriteMark>> asyncEventsListData =
        ref.watch(eventsListControllerProvider);
    final EventsListController controller =
        ref.read(eventsListControllerProvider.notifier);
    final isShowFilterButton = ref.watch(filterButtonProvider);

    return asyncEventsListData.when(
      data: (events) => Column(
        children: [
          Container(
            color: Theme.of(context).colorScheme.background,
            padding: const EdgeInsets.only(top: 20),
            width: double.infinity,
            child: Text(
              'Мероприятия',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(seconds: 5),
            transitionBuilder: (child, animation) {
              final slideAnimation = Tween<AlignmentGeometry>(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).animate(animation);

              return AlignTransition(
                alignment: slideAnimation,
                child: child,
              );
            },
            child: isShowFilterButton
                ? EventsFilters(
                    onSearchTextChanged: (value) {
                      // TODO: добавить реализацию поиска по списку событий.
                      throw UnimplementedError();
                    },
                    onCountryTextChanged: (value) {
                      // TODO: добавить реализацию фильтрации по стране.
                      throw UnimplementedError();
                    },
                    onCityTextChanged: (value) {
                      // TODO: добавить реализацию фильтрации по городу.
                      throw UnimplementedError();
                    },
                  )
                : const SizedBox(),
          ),
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
                          eventData: event,
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
      // TODO: в дальнейшем заменить на виджет для вывода ошибки
      error: (error, _) => Text(error.toString()),
      loading: () => const Align(
        alignment: Alignment.topCenter,
        child: LinearProgressIndicator(),
      ),
    );
  }
}
