import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:ows_events_mobile/core/network/network.dart';
import 'package:ows_events_mobile/core/repositories/events_repository.dart';
import 'package:ows_events_mobile/features/search/domain/search_parameter.dart';

//провайдер, хранящий результаты поиска
final findedEventsProvider = Provider(
  (ref) => EventsRepository(
    GetIt.I<EventsApi>(),
  ).getFindedEvents(),
);

// провайдер для проброски параметров поиска
final searchParameterProvider = Provider(
  (ref) => SearchParameter(
    searchLine: null,
    country: null,
    city: null,
  ),
);
