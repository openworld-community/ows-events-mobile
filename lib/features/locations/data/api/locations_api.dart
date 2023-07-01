import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ows_events_mobile/core/dio.dart';

part 'locations_api.g.dart';

@RestApi(
  baseUrl: "https://api.poster-test-peredelano.orby-tech.space/api/location",
)
abstract class LocationsApi {
  factory LocationsApi(Dio dio, {String baseUrl}) = _LocationsApi;

  @GET("/usedCountries")
  Future<List<String>> getCountries();

  @GET("/usedCities/{country}")
  Future<List<String>> getCities(@Path("country") String country);
}

final locationsApiProvider = Provider(
  (ref) => LocationsApi(
    ref.read(dioProvider),
  ),
);
