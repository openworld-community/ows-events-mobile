import 'package:freezed_annotation/freezed_annotation.dart';

part 'price.freezed.dart';

@freezed
class Price with _$Price {
  const factory Price({
    required final double minValue,
    required final double value,
    required final double maxValue,
    required final String currency,
  }) = _Price;
}
