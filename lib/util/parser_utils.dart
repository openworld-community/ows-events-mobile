import 'package:ows_events_mobile/features/events/domain/event.dart';
import 'package:ows_events_mobile/features/events/domain/location.dart';

class ParserUtils {
  static Map<String, dynamic> eventToJson(Event event) {
    return {
      "id": event.id,
      "title": event.title,
      "description": event.description,
      "date": event.date.toString(),
      "duration": event.duration.toString(),
      "location": event.location.toString(),
      "price": event.price.toString(),
      "url": event.url,
      "image": event.image,
    };
  }

  static Duration? durationFromString(String durationString) {
    if (durationString == 'null') return null;

    // TODO: Добавить парсинг Duration из строки
    return const Duration();
  }

  static Location locationFromString(String locationString) {
    // TODO: Добавить парсинг Location из строки
    return const Location(country: '', city: '');
  }
}
