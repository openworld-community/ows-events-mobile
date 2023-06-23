import 'dart:convert';

import 'package:ows_events_mobile/features/events/domain/event.dart';

class StoredEvents {
  StoredEvents({
    required this.list,
    required this.saveTime,
  });

  final List<Event> list;
  final DateTime saveTime;

  factory StoredEvents.fromJson(String json) {
    final dynamic data = jsonDecode(json);

    final DateTime saveTime = DateTime.parse(data['saveTime']);
    final List<dynamic>? listData = data['list'] as List<dynamic>?;
    final List<Event> list = (listData != null)
        ? listData.map((eventData) => Event.fromJson(eventData)).toList()
        : <Event>[];

    return StoredEvents(
      list: list,
      saveTime: saveTime,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'saveTime': saveTime.toString(),
      'list': list.map((event) => event.toString()).toString(),
    };
  }
}
