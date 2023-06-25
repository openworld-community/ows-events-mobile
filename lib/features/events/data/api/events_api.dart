import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/core/dio.dart';
import 'package:ows_events_mobile/features/events/data/response/event_response.dart';
import 'package:retrofit/retrofit.dart';

part 'events_api.g.dart';

@RestApi(baseUrl: "api.poster-test-peredelano.orby-tech.space")
@RestApi(
    baseUrl: "https://api.poster-test-peredelano.orby-tech.space/api/events/")
abstract class EventsApi {
  factory EventsApi(Dio dio, {String baseUrl}) = _EventsApi;

  @GET("events")
  Future<List<EventResponse>> getEvents();
}

final eventsApiProvider = Provider(
  (ref) => EventsApi(
    ref.read(dioProvider),
  ),
);
