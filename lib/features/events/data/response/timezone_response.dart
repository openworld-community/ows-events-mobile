import 'package:freezed_annotation/freezed_annotation.dart';

part 'timezone_response.freezed.dart';

part 'timezone_response.g.dart';

@freezed
class TimezoneResponse with _$TimezoneResponse {
  const factory TimezoneResponse({
    @JsonKey(name: "timezoneName") required final String timezoneName,
    @JsonKey(name: "timezoneOffset") final String? timezoneOffset,
  }) = _TimezoneResponse;

  factory TimezoneResponse.fromJson(Map<String, Object?> json) =>
      _$TimezoneResponseFromJson(json);
}
