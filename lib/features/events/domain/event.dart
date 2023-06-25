import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ows_events_mobile/util/parser_utils.dart';

import 'location.dart';

part 'event.freezed.dart';

@freezed
class Event with _$Event {
  const factory Event({
    required final String id,
    required final String title,
    required final String description,
    required final DateTime? date,
    required final Duration? duration,
    required final Location location,
    required final String price,
    required final String url,
    required final String image,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) {
    final eventData = json;
    return Event(
      id: eventData['id'],
      title: eventData['title'],
      description: eventData['description'],
      date: DateTime.parse(eventData['date']),
      duration: ParserUtils.durationFromString(eventData['duration']),
      location: ParserUtils.locationFromString(eventData['location']),
      price: eventData['price'],
      url: eventData['url'],
      image: eventData['image'],
    );
  }
}
