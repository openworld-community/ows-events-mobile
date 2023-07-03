import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/features/locations/data/repository/cities_repository.dart';
import 'package:ows_events_mobile/features/locations/data/repository/countries_repository.dart';

final FutureProvider<List<String>> countriesListProvider = FutureProvider(
  (ref) async {
    final repository = ref.read(countriesRepositoryProvider);
    final countriesList = await repository.getCountries();
    return countriesList;
  },
);

final citiesListProvider = FutureProvider.family<List<String>, String>(
  (ref, country) async {
    final repository = ref.read(citiesRepositoryProvider);
    final citiesList = await repository.getCities(country);
    return citiesList;
  },
);
