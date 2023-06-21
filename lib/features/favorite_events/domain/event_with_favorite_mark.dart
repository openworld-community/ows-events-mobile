import 'package:ows_events_mobile/features/events/domain/event.dart';

class EventWithFavoriteMark {
  EventWithFavoriteMark({
    required this.event,
    required this.favoriteMark,
  });

  Event event;
  bool favoriteMark;
}
