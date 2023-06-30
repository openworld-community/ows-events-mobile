import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_countries_response.freezed.dart';

@freezed
class CurrentCountriesResponse with _$CurrentCountriesResponse {
  const factory CurrentCountriesResponse(
    final List<String> countriesList,
  ) = _CurrentCountriesResponse;
}
