import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/features/favorite_events/data/favorite_events_api.dart';
import 'package:ows_events_mobile/features/favorite_events/domain/favorite_events.dart';

class FavoriteEventsRepository {
  const FavoriteEventsRepository({
    required this.api,
  });

  final FavoriteEventsApi api;

  Future<FavoriteEvents?> getFavoriteEvents() async {
    final List<String>? idsList = await api.getFavoriteEventsIds();

    if (idsList != null) {
      return FavoriteEvents(idsList: idsList);
    }

    return null;
  }

  Future<bool?> setFavoriteEvents(FavoriteEvents favoriteEvents) async {
    final List<String> idsList = favoriteEvents.idsList;

    if (idsList.isNotEmpty) {
      return await api.setFavoriteEventsIds(idsList);
    }

    return false;
  }
}

final favoriteEventsRepositoryProvider =
    Provider((ref) => FavoriteEventsRepository(
          api: ref.read(favoriteEventsApiProvider),
        ));
