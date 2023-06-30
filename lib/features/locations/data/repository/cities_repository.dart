import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/features/locations/data/api/locations_api.dart';
import 'package:ows_events_mobile/features/locations/data/locations_provider.dart';

class CitiesRepository {
  const CitiesRepository({
    required this.api,
  });

  final LocationsApi api;

  Future<List<String>> getCities() async {
    final List<String> citiesResponse =
        await api.getCities(currentCountryProvider);
    return citiesResponse;
  }
}

final citiesRepositoryProvider = Provider(
  (ref) async => CitiesRepository(
    api: await ref.read(locationsApiProvider),
  ),
);
