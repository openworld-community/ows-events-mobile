import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedCountryProvider = StateProvider<String?>((ref) => null);
final selectedCityProvider = StateProvider<String?>((ref) => null);
final selectedDatesProvider = StateProvider<DateTimeRange?>((ref) => null);
