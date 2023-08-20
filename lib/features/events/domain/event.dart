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
    required final String? priceMin,
    required final String? priceFix,
    required final String? priceMax,
    required final String? priceCurrency,
    required final String url,
    required final String? image,
    required final List<String>? tags,
  }) = _Event;
}
