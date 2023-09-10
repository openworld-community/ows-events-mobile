import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/features/filters/domain/price_currency.dart';

final categoriesFilterProvider =
    StateProvider.autoDispose<List<Category>?>((ref) => null);
final datesRangeFilterProvider =
    StateProvider.autoDispose<DateTimeRange?>((ref) => null);
final priceCurrencyFilterProvider =
    StateProvider.autoDispose<PriceCurrency?>((ref) => null);
