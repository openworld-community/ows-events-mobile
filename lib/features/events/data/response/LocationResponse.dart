import 'package:freezed_annotation/freezed_annotation.dart';

part 'LocationResponse.freezed.dart';

part 'LocationResponse.g.dart';

@freezed
class LocationResponse with _$LocationResponse {
  const factory LocationResponse({
    @JsonKey(name: "country") required final String country,
    @JsonKey(name: "city") required final String city,
  }) = _LocationResponse;

  factory LocationResponse.fromJson(Map<String, Object?> json) =>
      _$LocationResponseFromJson(json);
}
