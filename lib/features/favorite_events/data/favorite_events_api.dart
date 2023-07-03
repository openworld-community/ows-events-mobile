import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:ows_events_mobile/core/local_store.dart';
import 'package:ows_events_mobile/core/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteEventsApi {
  const FavoriteEventsApi({
    required this.ref,
    required this.localStoreProvider,
    required this.logger,
  });

  final Ref ref;
  final FutureProvider<SharedPreferences> localStoreProvider;
  final Logger logger;
  static const key = 'favoriteEventsIds';

  Future<List<String>?> getFavoriteEventsIds() async {
    try {
      final SharedPreferences localStorage =
          await ref.read(localStoreProvider.future);
      return localStorage.getStringList(FavoriteEventsApi.key);
    } catch (error) {
      logger.e(
        'getFavoriteEventsIdsError'.tr(),
        error,
        StackTrace.current,
      );

      rethrow;
    }
  }

  Future<bool?> setFavoriteEventsIds(List<String> ids) async {
    try {
      final SharedPreferences localStorage =
          await ref.read(localStoreProvider.future);

      return await localStorage.setStringList(FavoriteEventsApi.key, ids);
    } catch (error) {
      logger.e(
        'setFavoriteEventsIdsError'.tr(),
        error,
        StackTrace.current,
      );

      rethrow;
    }
  }
}

final favoriteEventsApiProvider = Provider((ref) => FavoriteEventsApi(
      ref: ref,
      localStoreProvider: localStoreProvider,
      logger: ref.read(loggerProvider),
    ));
