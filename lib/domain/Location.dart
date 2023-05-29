import 'package:freezed_annotation/freezed_annotation.dart';

part 'Location.freezed.dart';

part 'Location.g.dart';

@freezed
class Location with _$Location {
  const factory Location({
    @JsonKey(name: "country") required final String country,
    @JsonKey(name: "city") required final String city,
  }) = _Location;

  factory Location.fromJson(Map<String, Object?> json) =>
      _$LocationFromJson(json);
}
