import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:talker_flutter/talker_flutter.dart';

final locationProvider = FutureProvider<String>(
  (ref) async {
    try {
      final position = await _determinePosition();
      final placemarksList = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      if (placemarksList.isNotEmpty) {
        final placemark = placemarksList.first;
        return '${placemark.country}'
            '${placemark.locality == '' ? '' : ', ${placemark.locality}'}';
      } else {
        GetIt.I<Talker>().error(
          'getLocationNotFoundError'.tr(),
          Exception('placeMarksListIsEmptyError'.tr()),
          StackTrace.current,
        );
        return 'locationNotFound'.tr();
      }
    } catch (error, stack) {
      GetIt.I<Talker>().handle(
        error,
        stack,
        'getLocationNotFoundError'.tr(),
      );
      return 'locationNotFound'.tr();
    }
  },
);

Future<Position> _determinePosition() async {
  var permission = await Geolocator.requestPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error(
        'locationPermissionHaveBeenDenied'.tr(),
      );
    }
  }
  return await Geolocator.getCurrentPosition();
}
