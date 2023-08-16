import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:ows_events_mobile/features/events/domain/event.dart';
import 'package:ows_events_mobile/features/events/domain/location.dart';

import 'package:ows_events_mobile/core/network/events_api.dart';

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
        priceMin: e.price?.minValue.toString(),
        priceFix: e.price?.value.toString(),
        priceMax: e.price?.maxValue.toString(),
        priceCurrency: e.price?.currency,
        url: e.url,
        image: e.image,
        tags: e.tags,
      );
    }).toList();
  }
}

final eventsRepositoryProvider = Provider(
  (ref) => EventsRepository(
    GetIt.I<EventsApi>(),
  ),
);
