import 'package:ows_events_mobile/features/events/domain/event.dart';
import 'package:ows_events_mobile/features/events/domain/location.dart';

class ParserUtils {
  static Map<String, dynamic> eventToJson(Event event) {
    return {
      "id": event.id,
      "title": event.title,
      "description": event.description,
      "date": event.date.toString(),
      "duration": event.duration?.inMicroseconds.toString() ?? '0',
      "location": locationToJson(event.location),
      "price": event.price.toString(),
      "url": event.url,
      "image": event.image,
    };
  }

  static Duration? durationFromString(String? durationString) {
    if (durationString == null) return null;

    return Duration(milliseconds: int.parse(durationString));
  }

  static Location locationFromJson(Map<String, dynamic> locationJson) {
    return Location(
      country: locationJson['country'],
      city: locationJson['city'],
    );
  }

  static Map<String, dynamic> locationToJson(Location location) {
    return {
      "country": location.country,
      "city": location.city,
    };
  }
}
