import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ows_events_mobile/core/logger.dart';

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
      'Местоположение не найдено',
      Exception('placemarksList is empty'),
      StackTrace.current,
    );
    return 'Локация не определена';
  } catch (error) {
    logger.e(
      'Error in locationProvider',
      error,
      StackTrace.current,
    );
    return 'Локация не определена';
  }
});

Future<Position> _determinePosition() async {
  var permission = await Geolocator.requestPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location Permission are denied');
    }
  }
  return await Geolocator.getCurrentPosition();
}
