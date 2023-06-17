import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:ows_events_mobile/core/logger.dart';
import 'package:ows_events_mobile/features/events/data/events_repository.dart';
import 'package:ows_events_mobile/features/events/domain/event.dart';

class EventsListController extends StateNotifier<AsyncValue<List<Event>>> {
  EventsListController({
    required this.logger,
    required this.repository,
  }) : super(const AsyncData([])) {
    init();
  }

  final Logger logger;
  final EventsRepository repository;

  init() async {
    state = const AsyncLoading();

    try {
      final List<Event> eventsList = await repository.getEvents();

      if (mounted == true) {
        state = AsyncData(eventsList);
      }
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
      logger.e('EventsListController.init', error, StackTrace.current);
    }
  }
}

final eventsListControllerProvider =
    StateNotifierProvider<EventsListController, AsyncValue<List<Event>>>(
        (ref) => EventsListController(
              logger: ref.read(loggerProvider),
              repository: ref.read(eventsRepositoryProvider),
            ));
