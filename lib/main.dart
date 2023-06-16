import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/app.dart';

void main() async {
  runApp(const ProviderScope(
    child: App(),
  ));
}
