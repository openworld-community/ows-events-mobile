import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

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
    required final int price,
    required final String url,
    required final String image,
  }) = _Event;

  factory Event.fromJson(String json) {
    final eventData = jsonDecode(json);
    return Event(
      id: eventData['id'],
      title: eventData['title'],
      description: eventData['description'],
      date: DateTime.parse(eventData['date']),
      duration: eventData['duration'] as Duration,
      location: eventData['location'],
      price: eventData['price'] as int,
      url: eventData['url'],
      image: eventData['image'],
    );
  }
}
