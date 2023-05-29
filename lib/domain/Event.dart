import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ows_events_mobile/domain/Location.dart';
import 'package:ows_events_mobile/domain/Timezone.dart';

part 'Event.freezed.dart';

part 'Event.g.dart';

@freezed
class Event with _$Event {
  const factory Event({
    @JsonKey(name: "id") required final String id,
    @JsonKey(name: "title") required final String title,
    @JsonKey(name: "description") required final String description,
    @JsonKey(name: "date") final int? date,
    @JsonKey(name: "durationInSeconds") final int? durationInSeconds,
    @JsonKey(name: "location") required final Location location,
    @JsonKey(name: "price") required final int price,
    @JsonKey(name: "timezone") required final Timezone timezone,
    @JsonKey(name: "url") required final String url,
    @JsonKey(name: "image") required final String image,
  }) = _Event;

  factory Event.fromJson(Map<String, Object?> json) => _$EventFromJson(json);
}
