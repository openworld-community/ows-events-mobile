import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/features/locations/data/api/locations_api.dart';

class CitiesRepository {
  const CitiesRepository({
    required this.api,
  });

  final LocationsApi api;

  Future<List<String>> getCities(String country) async {
    final List<String> citiesResponse = await api.getCities(country);
    return citiesResponse;
  }
}

final citiesRepositoryProvider = Provider(
  (ref) => CitiesRepository(
    api: ref.read(locationsApiProvider),
  ),
);
