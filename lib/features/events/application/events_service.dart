import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/core/logger.dart';
import 'package:ows_events_mobile/features/events/data/events_local_store_repository.dart';
import 'package:ows_events_mobile/features/events/data/events_provider.dart';
import 'package:ows_events_mobile/features/events/domain/event.dart';
import 'package:ows_events_mobile/features/events/domain/stored_events.dart';
import 'package:ows_events_mobile/features/favorite_events/data/favorite_events_repository.dart';
import 'package:ows_events_mobile/features/favorite_events/data/favotire_events_provider.dart';
import 'package:ows_events_mobile/features/favorite_events/domain/event_with_favorite_mark.dart';
import 'package:ows_events_mobile/features/favorite_events/domain/favorite_events.dart';

class EventsService {
  EventsService({
    required this.ref,
    required this.eventsProvider,
    required this.favoriteEventsProvider,
    required this.favoriteEventsRepository,
    required this.eventsLocalStoreRepository,
  });

  final Ref ref;
  final FutureProvider<List<Event>> eventsProvider;
  final FutureProvider<FavoriteEvents> favoriteEventsProvider;
  final FavoriteEventsRepository favoriteEventsRepository;
  final EventsLocalStoreRepository eventsLocalStoreRepository;
  final Logger logger;

  late List<Event> _eventsList;
  late FavoriteEvents _favoriteEvents;
  bool connectionError = false;
  DateTime? saveDataTime;

  Future<List<EventWithFavoriteMark>> getEvents() async {
    try {
      _eventsList =
          await ref.read(eventsProvider.future).catchError((error) async {
        connectionError = true;
        final StoredEvents? storedEvents =
            await eventsLocalStoreRepository.getEvents();
        if (storedEvents != null) {
          saveDataTime = storedEvents.saveTime;
          return storedEvents.list;
        }
        throw Exception('$error. ${"getStoredEventsError".tr()}');
      });
    } catch (error) {
      logger.e('getEventsError'.tr(), error, StackTrace.current);
      rethrow;
    }

    try {
      _favoriteEvents = await ref.read(favoriteEventsProvider.future);

      return _mapMarksToEvents(_eventsList, _favoriteEvents);
    } catch (error) {
      logger.e(
        'getFavoriteEventsIdsError'.tr(),
        error,
        StackTrace.current,
      );
      rethrow;
    }
  }

  Future<List<EventWithFavoriteMark>> toggleEventToFavorites(String id) async {
    try {
      _favoriteEvents.toggleIds(id);

      await favoriteEventsRepository.setFavoriteEvents(_favoriteEvents);

      return _mapMarksToEvents(_eventsList, _favoriteEvents);
    } catch (error) {
      logger.e('toggleFavoriteEventError'.tr(), error, StackTrace.current);
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

final eventsServiceProvider = Provider<EventsService>((ref) => EventsService(
      ref: ref,
      eventsProvider: eventsProvider,
      favoriteEventsProvider: favoriteEventsProvider,
      favoriteEventsRepository: ref.read(favoriteEventsRepositoryProvider),
      eventsLocalStoreRepository: ref.read(eventsLocalStoreRepositoryProvider),
      logger: ref.read(loggerProvider),
    ));
