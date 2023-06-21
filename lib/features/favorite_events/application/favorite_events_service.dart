import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:ows_events_mobile/core/logger.dart';
import 'package:ows_events_mobile/features/events/data/events_provider.dart';
import 'package:ows_events_mobile/features/events/domain/event.dart';
import 'package:ows_events_mobile/features/favorite_events/data/favorite_events_repository.dart';
import 'package:ows_events_mobile/features/favorite_events/domain/event_with_favorite_mark.dart';
import 'package:ows_events_mobile/features/favorite_events/domain/favorite_events.dart';

class FavoriteEventsService {
  FavoriteEventsService({
    required this.ref,
    required this.logger,
    required this.eventsProvider,
    required this.favoriteEventsRepository,
  });

  final Ref ref;
  final FutureProvider<List<Event>> eventsProvider;
  final FavoriteEventsRepository favoriteEventsRepository;
  final Logger logger;

  late List<Event> _eventsList;
  late FavoriteEvents _favoriteEvents;

  Future<List<EventWithFavoriteMark>> getEventsWidthFavoriteMark() async {
    try {
      _eventsList = await ref.read(eventsProvider.future);
      _favoriteEvents = await favoriteEventsRepository.getFavoriteEvents();

      return _mapMarksToEvents(_eventsList, _favoriteEvents);
    } catch (error) {
      logger.e(
          'Ошибка при получении списка событий и списка id избранных событий',
          error,
          StackTrace.current);
      rethrow;
    }
  }

  Future<List<EventWithFavoriteMark>> toggleEventToFavorites(String id) async {
    try {
      _favoriteEvents.toggleIds(id);

      await favoriteEventsRepository.setFavoriteEvents(_favoriteEvents);

      return _mapMarksToEvents(_eventsList, _favoriteEvents);
    } catch (error) {
      logger.e('Ошибка при переключении избранности события', error,
          StackTrace.current);
      rethrow;
    }
  }

  List<EventWithFavoriteMark> _mapMarksToEvents(
      List<Event> eventsList, FavoriteEvents favoriteEvents) {
    return eventsList.map((event) {
      final bool favoriteMark = favoriteEvents.checkIdInList(event.id);

      return EventWithFavoriteMark(
        event: event,
        favoriteMark: favoriteMark,
      );
    }).toList();
  }
}

final favoriteEventsServiceProvider =
    Provider<FavoriteEventsService>((ref) => FavoriteEventsService(
          ref: ref,
          eventsProvider: eventsProvider,
          favoriteEventsRepository: ref.read(favoriteEventsRepositoryProvider),
          logger: ref.read(loggerProvider),
        ));
