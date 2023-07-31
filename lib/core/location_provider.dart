import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ows_events_mobile/core/position_manager.dart';
import 'package:talker_flutter/talker_flutter.dart';

final locationProvider = FutureProvider<String>((ref) async {
  try {
    final position = await PositionManager.determinePosition();
    final placemarksList = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    if (placemarksList.isNotEmpty) {
      final placemark = placemarksList.first;
      return '${placemark.country}'
          '${placemark.locality == '' ? '' : ', ${placemark.locality}'}';
    }
    // logger.e(
    //   'getLocationNotFoundError'.tr(),
    //   Exception('placeMarksListIsEmptyError'.tr()),
    //   StackTrace.current,
    // );
    return 'locationNotFound'.tr();
  } catch (error, stack) {
    GetIt.I<Talker>().handle(
      error,
      stack,
      'getLocationNotFoundError'.tr(),
    );
    return 'locationNotFound'.tr();
  }
});

final positionProvider = FutureProvider<Position?>((ref) async {
  try {
    final position = await PositionManager.determinePosition();
    return position;
  } catch (error, stack) {
    GetIt.I<Talker>().handle(
      error,
      stack,
      'getLocationNotFoundError'.tr(),
    );
  }
  return null;
});
