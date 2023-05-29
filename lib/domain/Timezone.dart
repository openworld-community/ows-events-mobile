import 'package:freezed_annotation/freezed_annotation.dart';

part 'Timezone.freezed.dart';

part 'Timezone.g.dart';

@freezed
class Timezone with _$Timezone {
  const factory Timezone({
    @JsonKey(name: "timezoneName") required final String timezoneName,
    @JsonKey(name: "timezoneOffset") final String? timezoneOffset,
  }) = _Timezone;

  factory Timezone.fromJson(Map<String, Object?> json) =>
      _$TimezoneFromJson(json);
}
