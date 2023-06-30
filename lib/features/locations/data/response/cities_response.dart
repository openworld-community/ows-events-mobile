import 'package:freezed_annotation/freezed_annotation.dart';

part 'cities_response.freezed.dart';

@freezed
class CitiesResponse with _$CitiesResponse {
  const factory CitiesResponse(
    final List<String> citiesList,
  ) = _CitiesResponse;
}
