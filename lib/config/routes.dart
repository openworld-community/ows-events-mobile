import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:ows_events_mobile/features/event/presentation/event_screen.dart';
import 'package:ows_events_mobile/features/favorite_events/presentation/favorite_events_screen.dart';
import 'package:ows_events_mobile/features/main/presentation/main_screen.dart';
import 'package:talker_flutter/talker_flutter.dart';

// Конфигурация GoRouter
final routerConfig = GoRouter(
  observers: [
    TalkerRouteObserver(
      GetIt.I<Talker>(),
    ),
  ],
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'mainScreen',
      path: '/',
      builder: (context, state) => const MainScreen(),
      routes: [
        GoRoute(
          name: 'eventsList',
          path: 'events',
          builder: (context, state) => const MainScreen(),
          routes: [
            GoRoute(
              name: 'eventScreen',
              path: ':id',
              builder: (context, state) => EventScreen(
                id: state.pathParameters['id']!,
              ),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      name: 'favouriteEventsScreen',
      path: '/favourite',
      builder: (context, state) => const FavoriteEventsScreen(),
    ),
  ],
);
