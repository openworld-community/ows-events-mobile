import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/features/events/data/api/events_local_store.dart';
import 'package:ows_events_mobile/features/events/domain/event.dart';
import 'package:ows_events_mobile/features/events/domain/stored_events.dart';

class EventsLocalStoreRepository {
  const EventsLocalStoreRepository({
    required this.api,
  });

  final EventsLocalStore api;

  Future<StoredEvents?> getEvents() async {
    final String? json = await api.getEvents();

    return json != null ? StoredEvents.fromJson(json) : null;
  }

  Future<bool?> setEvents(List<Event> eventsList) async {
    final StoredEvents storedEvents = StoredEvents(
      list: eventsList,
      saveTime: DateTime.timestamp(),
    );
    final String json = jsonEncode(storedEvents.toJson());

    return await api.setEvents(json);
  }
}

final eventsLocalStoreRepositoryProvider =
    Provider((ref) => EventsLocalStoreRepository(
          api: ref.read(eventsLocalStoreProvider),
        ));
