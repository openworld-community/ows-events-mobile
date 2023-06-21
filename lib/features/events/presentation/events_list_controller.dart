import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/features/favorite_events/application/favorite_events_service.dart';
import 'package:ows_events_mobile/features/favorite_events/domain/event_with_favorite_mark.dart';

class EventsListController
    extends StateNotifier<AsyncValue<List<EventWithFavoriteMark>>> {
  EventsListController({
    required this.favoriteEventsService,
  }) : super(const AsyncData([])) {
    init();
  }

  final FavoriteEventsService favoriteEventsService;

  init() async {
    state = const AsyncLoading();

    try {
      final List<EventWithFavoriteMark> eventsWithFavoriteMarksList =
          await favoriteEventsService.getEventsWidthFavoriteMark();
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
          await favoriteEventsService.toggleEventToFavorites(id);
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
          favoriteEventsService: ref.read(favoriteEventsServiceProvider),
        ));
