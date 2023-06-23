import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:ows_events_mobile/core/local_store.dart';
import 'package:ows_events_mobile/core/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventsLocalStore {
  EventsLocalStore({
    required this.ref,
    required this.localStoreProvider,
    required this.logger,
  });

  final Ref ref;
  final FutureProvider<SharedPreferences> localStoreProvider;
  final Logger logger;

  static const String key = 'events';

  Future<String?> getEvents() async {
    try {
      final SharedPreferences localStorage =
          await ref.read(localStoreProvider.future);
      return localStorage.getString(EventsLocalStore.key);
    } catch (error) {
      logger.e(
        'Error in the process of getting saved events',
        error,
        StackTrace.current,
      );

      rethrow;
    }
  }

  Future<bool> setEvents(String eventsJson) async {
    try {
      final SharedPreferences localStorage =
          await ref.read(localStoreProvider.future);
      await localStorage.remove(EventsLocalStore.key);

      return await localStorage.setString(EventsLocalStore.key, eventsJson);
    } catch (error) {
      logger.e(
        'Error in the process of saving events list json',
        error,
        StackTrace.current,
      );

      rethrow;
    }
  }
}

final eventsLocalStoreProvider =
    Provider<EventsLocalStore>((ref) => EventsLocalStore(
          ref: ref,
          localStoreProvider: localStoreProvider,
          logger: ref.read(loggerProvider),
        ));
