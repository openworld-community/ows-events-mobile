import 'package:easy_localization/easy_localization.dart';
import 'package:geolocator/geolocator.dart';

class PositionManager {
  static Future<Position> determinePosition() async {
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
}
