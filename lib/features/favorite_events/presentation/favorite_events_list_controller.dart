import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/features/events/application/events_service.dart';
import 'package:ows_events_mobile/features/events/presentation/events_list_controller.dart';
import 'package:ows_events_mobile/features/favorite_events/domain/event_with_favorite_mark.dart';

class FavoriteEventsListController
    extends StateNotifier<AsyncValue<List<EventWithFavoriteMark>>> {
  FavoriteEventsListController({
    required this.eventsService,
    required this.asyncEventsListData,
    required this.eventsListController,
  }) : super(const AsyncData([])) {
    init();
  }

  final EventsService eventsService;
  final AsyncValue<List<EventWithFavoriteMark>> asyncEventsListData;
  final EventsListController eventsListController;
  bool connectionError = false;
  DateTime? saveDataTime;

  init() async {
    state = const AsyncLoading();

    try {
      if (mounted) {
        state = asyncEventsListData;
      }
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }

  void toggleEventToFavorites(String id) async {
    try {
      eventsListController.toggleEventToFavorites(id);
      if (mounted) {
        state = asyncEventsListData;
      }
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }
}

final favoriteEventsListControllerProvider = StateNotifierProvider<
        FavoriteEventsListController, AsyncValue<List<EventWithFavoriteMark>>>(
    (ref) => FavoriteEventsListController(
          eventsService: ref.read(eventsServiceProvider),
          asyncEventsListData: ref.watch(eventsListControllerProvider),
          eventsListController: ref.read(eventsListControllerProvider.notifier),
        ));
