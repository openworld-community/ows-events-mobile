import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localStoreProvider = FutureProvider<SharedPreferences>((ref) async {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  return await prefs;
});
