import 'package:freezed_annotation/freezed_annotation.dart';

part 'Location.freezed.dart';

@freezed
class Location with _$Location {
  const factory Location({
    required final String country,
    required final String city,
  }) = _Location;
}
