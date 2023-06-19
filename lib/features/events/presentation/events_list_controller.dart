import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:ows_events_mobile/core/logger.dart';
import 'package:ows_events_mobile/features/events/data/events_repository.dart';
import 'package:ows_events_mobile/features/events/domain/event.dart';
import 'package:ows_events_mobile/features/favorite_events/data/favorite_events_repository.dart';
import 'package:ows_events_mobile/features/favorite_events/domain/event_with_favorite_mark.dart';
import 'package:ows_events_mobile/features/favorite_events/domain/favorite_events.dart';

class EventsListController
    extends StateNotifier<AsyncValue<List<EventWithFavoriteMark>>> {
  EventsListController({
    required this.logger,
    required this.repository,
    required this.favoriteEventsRepository,
  }) : super(const AsyncData([])) {
    init();
  }

  final Logger logger;
  final EventsRepository repository;
  final FavoriteEventsRepository favoriteEventsRepository;

  init() async {
    state = const AsyncLoading();

    try {
      final List<Event> eventsList = await repository.getEvents();
      final FavoriteEvents favoriteEvents =
          await favoriteEventsRepository.getFavoriteEvents();
      final List<EventWithFavoriteMark> eventsWithFavoriteMarksList =
          eventsList.map((event) {
        final bool favoriteMark = favoriteEvents.checkIdInList(event.id);
        ;
        return EventWithFavoriteMark(
          event: event,
          favoriteMark: favoriteMark,
        );
      }).toList();

      if (mounted == true) {
        state = AsyncData(eventsWithFavoriteMarksList);
      }
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
      logger.e('EventsListController.init', error, StackTrace.current);
    }
  }
}

final eventsListControllerProvider = StateNotifierProvider<
        EventsListController, AsyncValue<List<EventWithFavoriteMark>>>(
    (ref) => EventsListController(
          logger: ref.read(loggerProvider),
          repository: ref.read(eventsRepositoryProvider),
          favoriteEventsRepository: ref.read(favoriteEventsRepositoryProvider),
        ));
