import 'package:dio/dio.dart';
import 'package:ows_events_mobile/features/events/data/response/event_response.dart';
import 'package:ows_events_mobile/features/search/domain/search_parameter.dart';
import 'package:retrofit/retrofit.dart';

part 'events_api.g.dart';

@RestApi(baseUrl: "https://api.poster-test-peredelano.orby-tech.space/api/")
abstract class EventsApi {
  factory EventsApi(Dio dio, {String baseUrl}) = _EventsApi;

  @GET("events")
  Future<List<EventResponse>> getEvents();

  @GET("evens/{id}")
  Future<EventResponse> getEventInfo(@Path("id") String id);

  @GET("evens/{id}")
  Future<List<EventResponse>> getFindedEvents(
    @Path("searchLine") SearchParameter searchParameter,
  );

  @GET("/usedCountries")
  Future<List<String>> getCountries();

  @GET("/usedCities/{country}")
  Future<List<String>> getCities(@Path("country") String country);
}
