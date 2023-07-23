import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_response.freezed.dart';

part 'price_response.g.dart';

@freezed
class PriceResponse with _$PriceResponse {
  const factory PriceResponse({
    @JsonKey(name: "minValue") required final double minValue,
    @JsonKey(name: "value") required final double value,
    @JsonKey(name: "maxValue") required final double maxValue,
    @JsonKey(name: "currency") required final String currency,
  }) = _PriceResponse;

  factory PriceResponse.fromJson(Map<String, Object?> json) =>
      _$PriceResponseFromJson(json);
}
