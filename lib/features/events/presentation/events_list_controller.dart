import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/features/events/application/events_service.dart';
import 'package:ows_events_mobile/features/favorite_events/domain/event_with_favorite_mark.dart';

class EventsListController
    extends StateNotifier<AsyncValue<List<EventWithFavoriteMark>>> {
  EventsListController({
    required this.eventsService,
  }) : super(const AsyncData([])) {
    init();
  }

  final EventsService eventsService;
  bool connectionError = false;
  DateTime? saveDataTime;

  init() async {
    state = const AsyncLoading();

    try {
      final List<EventWithFavoriteMark> eventsWithFavoriteMarksList =
          await eventsService.getEvents();

      if (mounted == true) {
        state = AsyncData(eventsWithFavoriteMarksList);
      }
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }

  void toggleEventToFavorites(String id) async {
    try {
      final List<EventWithFavoriteMark> eventsWithFavoriteMarksList =
          await eventsService.toggleEventToFavorites(id);
      if (mounted == true) {
        state = AsyncData(eventsWithFavoriteMarksList);
      }
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }

  List<EventWithFavoriteMark> filter(List<EventWithFavoriteMark> eventsList,
      String? country, String? city, DateTimeRange? dates) {
    if ((country == null && city == null && dates == null)) return eventsList;
    List<EventWithFavoriteMark> filteredEvents = state.value!;

    if (country != null) {
      filteredEvents = filteredEvents
          .where((element) => element.event.location.country == country)
          .toList();
    }

    if (city != null) {
      filteredEvents = filteredEvents
          .where((element) => element.event.location.city == city)
          .toList();
    }

    if (dates != null) {
      filteredEvents = filteredEvents
          .where((element) =>
              element.event.date!.isAfter(dates.start) &&
              element.event.date!.isBefore(dates.end))
          .toList();
    }

    return filteredEvents;
  }
}

final eventsListControllerProvider = StateNotifierProvider<
        EventsListController, AsyncValue<List<EventWithFavoriteMark>>>(
    (ref) => EventsListController(
          eventsService: ref.read(eventsServiceProvider),
        ));
