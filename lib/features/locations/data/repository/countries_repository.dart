import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:ows_events_mobile/core/network/network.dart';

class CountriesRepository {
  const CountriesRepository({
    required this.api,
  });

  final EventsApi api;

  Future<List<String>> getCountries() async {
    final List<String> countriesResponse = await api.getCountries();
    return countriesResponse;
  }
}

final countriesRepositoryProvider = Provider(
  (ref) => CountriesRepository(
    api: GetIt.I<EventsApi>(),
  ),
);
