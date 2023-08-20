import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:ows_events_mobile/features/events/presentation/events_list.dart';
import 'package:ows_events_mobile/features/events/domain/event.dart';
import 'package:ows_events_mobile/features/events/domain/location.dart';

import 'package:ows_events_mobile/core/network/network.dart';

class EventRepository {
  EventRepository(this.api, this.eventID);

  final EventsApi api;
  final String eventID;

  Future<Event> getEventInfo() async {
    final eventResponse = await api.getEventInfo(eventID);

    var date = eventResponse.date;
    var durationInSeconds = eventResponse.durationInSeconds;

    return Event(
      id: eventResponse.id,
      title: eventResponse.title,
      description: eventResponse.description,
      date: date != null
          ? DateTime.fromMillisecondsSinceEpoch(date.toInt())
          : null,
      duration: durationInSeconds != null
          ? Duration(seconds: durationInSeconds)
          : null,
      location: Location(
        country: eventResponse.location.country,
        city: eventResponse.location.city,
      ),
      priceMin: eventResponse.price?.minValue?.round().toString(),
      priceFix: eventResponse.price?.value?.round().toString(),
      priceMax: eventResponse.price?.maxValue?.round().toString(),
      priceCurrency: eventResponse.price?.currency.toString(),
      url: eventResponse.url,
      image: eventResponse.image,
      tags: eventResponse.tags,
    );
  }
}

final eventInfoRepositoryProvider = Provider(
  (ref) => EventRepository(
    GetIt.I<EventsApi>(),
    ref.watch(chosenEventIDProvider),
  ),
);
