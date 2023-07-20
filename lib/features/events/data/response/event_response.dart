import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ows_events_mobile/features/events/data/response/price_response.dart';
import 'package:ows_events_mobile/features/events/domain/event_price.dart';

import 'location_response.dart';
import 'timezone_response.dart';

part 'event_response.freezed.dart';

part 'event_response.g.dart';

@freezed
class EventResponse with _$EventResponse {
  const factory EventResponse({
    @JsonKey(name: "id") required final String id,
    @JsonKey(name: "title") required final String title,
    @JsonKey(name: "description") required final String description,
    @JsonKey(name: "date") final double? date,
    @JsonKey(name: "durationInSeconds") final int? durationInSeconds,
    @JsonKey(name: "location") required final LocationResponse location,
    @JsonKey(name: "price") required final PriceResponse? price,
    @JsonKey(name: "timezone") required final TimezoneResponse timezone,
    @JsonKey(name: "url") required final String url,
    @JsonKey(name: "image") required final String? image,
  }) = _EventResponse;

  factory EventResponse.fromJson(Map<String, Object?> json) =>
      _$EventResponseFromJson(json);
}
