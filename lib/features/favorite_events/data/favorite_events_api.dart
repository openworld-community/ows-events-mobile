import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:ows_events_mobile/core/local_store.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

class FavoriteEventsApi {
  const FavoriteEventsApi({
    required this.ref,
    required this.localStoreProvider,
  });

  final Ref ref;
  final FutureProvider<SharedPreferences> localStoreProvider;
  static const key = 'favoriteEventsIds';

  Future<List<String>?> getFavoriteEventsIds() async {
    try {
      final SharedPreferences localStorage =
          await ref.read(localStoreProvider.future);
      return localStorage.getStringList(FavoriteEventsApi.key);
    } catch (error, stack) {
      GetIt.I<Talker>().handle(
        error,
        stack,
        'getFavoriteEventsIdsError'.tr(),
      );

      rethrow;
    }
  }

  Future<bool?> setFavoriteEventsIds(List<String> ids) async {
    try {
      final SharedPreferences localStorage =
          await ref.read(localStoreProvider.future);

      return await localStorage.setStringList(FavoriteEventsApi.key, ids);
    } catch (error, stack) {
      GetIt.I<Talker>().handle(
        error,
        stack,
        'setFavoriteEventsIdsError'.tr(),
      );
      rethrow;
    }
  }
}

final favoriteEventsApiProvider = Provider(
  (ref) => FavoriteEventsApi(
    ref: ref,
    localStoreProvider: localStoreProvider,
  ),
);
