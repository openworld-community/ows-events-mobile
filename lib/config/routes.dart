import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:ows_events_mobile/features/event/presentation/event_screen.dart';
import 'package:ows_events_mobile/features/favorite_events/presentation/favorite_events_screen.dart';
import 'package:ows_events_mobile/features/home/presentation/home_screen.dart';
import 'package:ows_events_mobile/features/main/presentation/main_scaffold.dart';
import 'package:ows_events_mobile/features/profile/presentation/profile_screen.dart';
import 'package:talker_flutter/talker_flutter.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _screensNavigatorKey = GlobalKey<NavigatorState>();

// Конфигурация GoRouter
final routerConfig = GoRouter(
  observers: [
    TalkerRouteObserver(
      GetIt.I<Talker>(),
    ),
  ],
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      observers: [
        TalkerRouteObserver(
          GetIt.I<Talker>(),
        ),
      ],
      navigatorKey: _screensNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return MainScaffold(
          child: child,
        );
      },
      routes: [
        GoRoute(
          parentNavigatorKey: _screensNavigatorKey,
          name: 'homeScreen',
          path: '/',
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              name: 'eventScreen',
              path: 'events/:id',
              builder: (context, state) => EventScreen(
                id: state.pathParameters['id']!,
              ),
            ),
          ],
        ),
        GoRoute(
          parentNavigatorKey: _screensNavigatorKey,
          name: 'favouritesScreen',
          path: '/favourites',
          builder: (context, state) => const FavoriteEventsScreen(),
        ),
        GoRoute(
          parentNavigatorKey: _screensNavigatorKey,
          name: 'profileScreen',
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
  ],
);
