import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ows_events_mobile/features/events/domain/event_price.dart';
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
    required final EventPrice? price,
    required final String url,
    required final String? image,
  }) = _Event;
}
