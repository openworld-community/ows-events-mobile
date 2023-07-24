import 'package:go_router/go_router.dart';
import 'package:ows_events_mobile/features/favorite_events/presentation/favorite_events_screen.dart';
import 'package:ows_events_mobile/features/main/presentation/main_screen.dart';

// Конфигурация GoRouter
final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'mainScreen',
      path: '/',
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      name: 'favouriteEventsScreen',
      path: '/favourite',
      builder: (context, state) => const FavoriteEventsScreen(),
    ),
    // GoRoute(
    //   name: 'eventScreen',
    //   path: '/events/:id',
    //   builder: (context, state) => EventScreen(
    //     id: context.,
    //   ),
    ),
  ],
);
