import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:ows_events_mobile/core/logger.dart';

class EventsListItemController {
  EventsListItemController({
    required this.logger,
  });

  final Logger logger;

  void log(
    String message,
    Object error,
    StackTrace? stackTrace,
  ) {
    logger.e(
      message,
      error,
      stackTrace,
    );
  }
}

final eventsListItemControllerProvider =
    Provider((ref) => EventsListItemController(
          logger: ref.read(
            loggerProvider,
          ),
        ));
