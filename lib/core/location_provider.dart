import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ows_events_mobile/core/logger.dart';
import 'package:easy_localization/easy_localization.dart';

final locationProvider = FutureProvider<String>((ref) async {
  final logger = ref.read(loggerProvider);
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
    }
    logger.e(
      'getLocationNotFoundError'.tr(),
      Exception('placeMarksListIsEmptyError'.tr()),
      StackTrace.current,
    );
    return 'locationNotFound'.tr();
  } catch (error) {
    logger.e(
      'getLocationNotFoundError'.tr(),
      error,
      StackTrace.current,
    );
    return 'locationNotFound'.tr();
  }
});

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
