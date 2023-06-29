import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/features/events/application/events_service.dart';
import 'package:ows_events_mobile/features/favorite_events/domain/event_with_favorite_mark.dart';

class FavoriteEventsListController
    extends StateNotifier<AsyncValue<List<EventWithFavoriteMark>>> {
  FavoriteEventsListController({
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
      final List<EventWithFavoriteMark> eventsWithFavoriteMark =
          await eventsService.getEvents();
      connectionError = eventsService.connectionError;
      saveDataTime = eventsService.saveDataTime;

      if (mounted) {
        state = AsyncData(eventsWithFavoriteMark);
      }
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }

  void toggleEventToFavorites(String id) async {
    try {
      final List<EventWithFavoriteMark> eventsWithFavoriteMark =
          await eventsService.toggleEventToFavorites(id);
      if (mounted) {
        state = AsyncData(eventsWithFavoriteMark);
      }
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }
}

final favoriteEventsListControllerProvider = StateNotifierProvider<
        FavoriteEventsListController, AsyncValue<List<EventWithFavoriteMark>>>(
    (ref) => FavoriteEventsListController(
          eventsService: ref.read(eventsServiceProvider),
        ));
