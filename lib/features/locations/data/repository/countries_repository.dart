import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/features/locations/data/api/locations_api.dart';

class CountriesRepository {
  const CountriesRepository({
    required this.api,
  });

  final LocationsApi api;

  Future<List<String>> getCountries() async {
    final List<String> countriesResponse = await api.getCountries();
    return countriesResponse;
  }
}

final countriesRepositoryProvider = Provider(
  (ref) async => CountriesRepository(
    api: await ref.read(locationsApiProvider),
  ),
);
