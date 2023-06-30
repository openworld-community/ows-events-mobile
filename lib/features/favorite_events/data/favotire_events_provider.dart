import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ows_events_mobile/features/favorite_events/data/favorite_events_repository.dart';
import 'package:ows_events_mobile/features/favorite_events/domain/favorite_events.dart';

final favoriteEventsProvider = FutureProvider<FavoriteEvents>((ref) async {
  return await ref.read(favoriteEventsRepositoryProvider).getFavoriteEvents();
});
