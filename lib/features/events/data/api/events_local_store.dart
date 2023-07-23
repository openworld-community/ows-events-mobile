import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:ows_events_mobile/core/local_store.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

class EventsLocalStore {
  EventsLocalStore({
    required this.ref,
    required this.localStoreProvider,
  });

  final Ref ref;
  final FutureProvider<SharedPreferences> localStoreProvider;

  static const String key = 'events';

  Future<String?> getEvents() async {
    try {
      final SharedPreferences localStorage =
          await ref.read(localStoreProvider.future);
      return localStorage.getString(EventsLocalStore.key);
    } catch (error, stack) {
      GetIt.I<Talker>().handle(
        error,
        stack,
        'Error in the process of getting saved events',
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
    } catch (error, stack) {
      GetIt.I<Talker>().handle(
        error,
        stack,
        'Error in the process of saving events list json',
      );

      rethrow;
    }
  }
}

final eventsLocalStoreProvider = Provider<EventsLocalStore>(
  (ref) => EventsLocalStore(
    ref: ref,
    localStoreProvider: localStoreProvider,
  ),
);
