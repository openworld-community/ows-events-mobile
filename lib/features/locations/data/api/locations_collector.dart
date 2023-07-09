import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/features/events/data/events_provider.dart';
import 'package:ows_events_mobile/features/events/domain/event.dart';

class LocationsCollector {
  LocationsCollector({
    required this.eventsList,
  });

  List<Event> eventsList;

  List<String> getCountries() {
    final allCountries =
        eventsList.map((event) => event.location.country).toList();

    return allCountries.toSet().toList();
  }

  List<String> getCitiesForCountry(String country) {
    final allCities = eventsList
        .where((event) => event.location.country == country)
        .map((event) => event.location.city)
        .toList();

    return allCities.toSet().toList();
  }
}

final locationsCollectorProvider = FutureProvider((ref) async {
  final List<Event> eventsList = await ref.watch(eventsProvider.future);

  return LocationsCollector(eventsList: eventsList);
});
