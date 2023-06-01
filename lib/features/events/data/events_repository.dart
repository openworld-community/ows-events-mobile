import 'package:ows_events_mobile/features/events/domain/event.dart';
import 'package:ows_events_mobile/features/events/domain/location.dart';

import 'api/events_api.dart';

class EventsRepository {
  final EventsApi api;

  EventsRepository(this.api);

  Future<List<Event>> getEvents() async {
    final eventsResponse = await api.getEvents();

    return eventsResponse.map((e) {
      var date = e.date;
      var durationInSeconds = e.durationInSeconds;
      return Event(
        id: e.id,
        title: e.title,
        description: e.description,
        date: date != null ? DateTime.fromMillisecondsSinceEpoch(date) : null,
        duration: durationInSeconds != null
            ? Duration(seconds: durationInSeconds)
            : null,
        location: Location(
          country: e.location.country,
          city: e.location.city,
        ),
        price: e.price,
        url: e.url,
        image: e.image,
      );
    }).toList(growable: false);
  }
}
