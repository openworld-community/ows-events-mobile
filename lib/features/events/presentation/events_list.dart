import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/features/events/domain/event.dart';
import 'package:ows_events_mobile/features/events/presentation/events_filters.dart';
import 'package:ows_events_mobile/features/events/presentation/events_list_controller.dart';
import 'package:ows_events_mobile/features/events/presentation/events_list_item.dart';
import 'package:ows_events_mobile/util/time_utils.dart';

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
                  title: event.title,
                  description: event.description,
                  date: TimeUtils.formatDateTime(event.date),
                  venueLinkText:
                      '${event.location.country}, ${event.location.city}',
                  image: event.image,
                  price: event.price.toString(),
                  venueLinkAction: () {
                    // TODO: реализовать клик по месту проведения
                    throw UnimplementedError();
                  },
                  itemAction: () {
                    // TODO: реализовать клик по эвенту
                    throw UnimplementedError();
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
