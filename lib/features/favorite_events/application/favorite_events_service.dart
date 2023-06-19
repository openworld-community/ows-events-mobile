import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/features/favorite_events/data/favorite_events_repository.dart';
import 'package:ows_events_mobile/features/favorite_events/domain/favorite_events.dart';

class FavoriteEventsService {
  FavoriteEventsService({
    required this.repository,
  });

  final FavoriteEventsRepository repository;

  Future<bool> checkIdInFavoriteEvents(String id) async {
    final FavoriteEvents? favoriteEvents = await repository.getFavoriteEvents();

    if (favoriteEvents != null && favoriteEvents.idsList.isNotEmpty) {
      return favoriteEvents.checkIdInList(id);
    }

    return false;
  }
}

final favoriteEventsServiceProvider = Provider<FavoriteEventsService>((ref) =>
    FavoriteEventsService(
        repository: ref.read(favoriteEventsRepositoryProvider)));
