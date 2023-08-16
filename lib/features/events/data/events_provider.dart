import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/features/events/data/repository/events_repository.dart';
import 'package:ows_events_mobile/features/events/domain/event.dart';

final eventsProvider = FutureProvider<List<Event>>((ref) async {
  final EventsRepository repository = ref.read(eventsRepositoryProvider);
  final List<Event> eventsList = await repository.getEvents();

  return eventsList;
});
