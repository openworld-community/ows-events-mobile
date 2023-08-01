import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:ows_events_mobile/features/events/data/api/events_api.dart';

class CitiesRepository {
  const CitiesRepository({
    required this.api,
  });

  final EventsApi api;

  Future<List<String>> getCities(String country) async {
    final List<String> citiesResponse = await api.getCities(country);
    return citiesResponse;
  }
}

final citiesRepositoryProvider = Provider(
  (ref) => CitiesRepository(
    api: GetIt.I<EventsApi>(),
  ),
);
