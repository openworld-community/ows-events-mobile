import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_price.freezed.dart';

@freezed
class EventPrice with _$EventPrice {
  const factory EventPrice({
    required final double? minValue,
    required final double? value,
    required final double? maxValue,
    required final String? currency,
  }) = _EventPrice;
}
