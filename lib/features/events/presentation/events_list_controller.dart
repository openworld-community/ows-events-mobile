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

  init() async {
    state = const AsyncLoading();

    try {
      final List<EventWithFavoriteMark> eventsWithFavoriteMarksList =
          await eventsService.getEventsWidthFavoriteMark();
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
}

final eventsListControllerProvider = StateNotifierProvider<
        EventsListController, AsyncValue<List<EventWithFavoriteMark>>>(
    (ref) => EventsListController(
          eventsService: ref.read(eventsServiceProvider),
        ));
