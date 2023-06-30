import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/features/locations/data/repository/cities_repository.dart';
import 'package:ows_events_mobile/features/locations/data/repository/countries_repository.dart';

final FutureProvider<List<String>> countriesListProvider = FutureProvider(
  (ref) async {
    final repository = await ref.read(countriesRepositoryProvider);
    final countriesList = await repository.getCountries();
    return countriesList;
  },
);

final FutureProvider<List<String>> citiesListProvider = FutureProvider(
  (ref) async {
    final repository = await ref.read(citiesRepositoryProvider);
    final citiesList = await repository.getCities();
    return citiesList;
  },
);
