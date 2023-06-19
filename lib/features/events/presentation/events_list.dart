import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/features/event/presentation/event_screen.dart';
import 'package:ows_events_mobile/features/events/domain/event.dart';
import 'package:ows_events_mobile/features/events/presentation/events_filters.dart';
import 'package:ows_events_mobile/features/events/presentation/events_list_controller.dart';
import 'package:ows_events_mobile/features/events/presentation/events_list_item.dart';

class EventsList extends ConsumerWidget {
  const EventsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Event>> asyncEventsListData =
        ref.watch(eventsListControllerProvider);

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
          EventsFilters(
            onSearchTextChanged: (value) {
              // TODO: добавить реализацию поиска по списку событий.
              throw UnimplementedError();
            },
            onCountryTextChanged: (value) {
              // TODO: добавить реализацию фильтрации по стране.
              throw UnimplementedError();
            },
            onCityTextChanged: (value) {
              // TODO: добавить реализацию поиска по списку событий.
              throw UnimplementedError();
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                final Event event = events[index];

                return EventsListItem(
                  eventData: event,
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
                    // TODO: реализовать добавление события в избранное
                  },
                );
              },
            ),
          ),
        ],
      ),
      // TODO: в дальнейшем заменить на виджет для вывода ошибки
      error: (error, _) => Text(error.toString()),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
