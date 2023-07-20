import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/features/events/domain/event.dart';
import 'package:ows_events_mobile/features/events/domain/location.dart';
import 'package:ows_events_mobile/features/events/domain/event_price.dart';

import 'api/events_api.dart';

class EventsRepository {
  EventsRepository(this.api);

  final EventsApi api;

  Future<List<Event>> getEvents() async {
    final eventsResponse = await api.getEvents();

    return eventsResponse.map((e) {
      var date = e.date;
      var durationInSeconds = e.durationInSeconds;

      return Event(
        id: e.id,
        title: e.title,
        description: e.description,
        date: date != null
            ? DateTime.fromMillisecondsSinceEpoch(date.toInt())
            : null,
        duration: durationInSeconds != null
            ? Duration(seconds: durationInSeconds)
            : null,
        location: Location(
          country: e.location.country,
          city: e.location.city,
        ),
        price: e.price != null
            ? EventPrice(
                minValue: e.price!.minValue,
                value: e.price!.value,
                maxValue: e.price!.maxValue,
                currency: e.price!.currency,
              )
            : null,
        url: e.url,
        image: e.image,
      );
    }).toList();
  }
}

final eventsRepositoryProvider =
    Provider((ref) => EventsRepository(ref.read(eventsApiProvider)));
