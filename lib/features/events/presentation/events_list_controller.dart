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

  late List<Event> _eventsList;
  late FavoriteEvents _favoriteEvents;

  init() async {
    state = const AsyncLoading();

    try {
      _eventsList = await repository.getEvents();
      _favoriteEvents = await favoriteEventsRepository.getFavoriteEvents();
      _setState();
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
      logger.e('EventsListController.init', error, StackTrace.current);
    }
  }

  void _setState() {
    final List<EventWithFavoriteMark> eventsWithFavoriteMarksList =
        _eventsList.map((event) {
      final bool favoriteMark = _favoriteEvents.checkIdInList(event.id);
      ;
      return EventWithFavoriteMark(
        event: event,
        favoriteMark: favoriteMark,
      );
    }).toList();

    if (mounted == true) {
      state = AsyncData(eventsWithFavoriteMarksList);
    }
  }

  void toggleEventToFavorites(String id) {
    _favoriteEvents.toggleIds(id);

    favoriteEventsRepository.setFavoriteEvents(_favoriteEvents);

    _setState();
  }
}

final eventsListControllerProvider = StateNotifierProvider<
        EventsListController, AsyncValue<List<EventWithFavoriteMark>>>(
    (ref) => EventsListController(
          logger: ref.read(loggerProvider),
          repository: ref.read(eventsRepositoryProvider),
          favoriteEventsRepository: ref.read(favoriteEventsRepositoryProvider),
        ));
