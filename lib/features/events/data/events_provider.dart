import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/features/events/data/events_local_store_repository.dart';
import 'package:ows_events_mobile/features/events/data/events_repository.dart';
import 'package:ows_events_mobile/features/events/domain/event.dart';

final eventsProvider = FutureProvider<List<Event>>((ref) async {
  final EventsRepository repository = ref.read(eventsRepositoryProvider);
  final EventsLocalStoreRepository eventsLocalStoreRepository =
      ref.read(eventsLocalStoreRepositoryProvider);
  final List<Event> eventsList = await repository.getEvents();

  eventsLocalStoreRepository.setEvents(eventsList);

  return eventsList;
});
