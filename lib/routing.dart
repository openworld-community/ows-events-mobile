import 'package:go_router/go_router.dart';
import 'package:ows_events_mobile/main.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
  ],
);
