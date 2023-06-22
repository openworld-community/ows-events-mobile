import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:ows_events_mobile/core/logger.dart';

class LoggerController {
  WidgetRef ref;
  String message;
  Level level;

  LoggerController({
    required this.ref,
    required this.message,
    required this.level,
  }) {
    _init();
  }

  void _init() {
    final logger = ref.read(loggerProvider);
    logger.log(level, message);
  }
}

void log(
  WidgetRef ref,
  String message,
  Level level,
) {
  LoggerController(
    ref: ref,
    message: message,
    level: level,
  );
}
