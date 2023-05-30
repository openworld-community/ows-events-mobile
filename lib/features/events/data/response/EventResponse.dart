import 'package:freezed_annotation/freezed_annotation.dart';

import 'LocationResponse.dart';
import 'TimezoneResponse.dart';

part 'EventResponse.freezed.dart';

part 'EventResponse.g.dart';

@freezed
class EventResponse with _$EventResponse {
  const factory EventResponse({
    @JsonKey(name: "id") required final String id,
    @JsonKey(name: "title") required final String title,
    @JsonKey(name: "description") required final String description,
    @JsonKey(name: "date") final int? date,
    @JsonKey(name: "durationInSeconds") final int? durationInSeconds,
    @JsonKey(name: "location") required final LocationResponse location,
    @JsonKey(name: "price") required final int price,
    @JsonKey(name: "timezone") required final TimezoneResponse timezone,
    @JsonKey(name: "url") required final String url,
    @JsonKey(name: "image") required final String image,
  }) = _EventResponse;

  factory EventResponse.fromJson(Map<String, Object?> json) =>
      _$EventResponseFromJson(json);
}
