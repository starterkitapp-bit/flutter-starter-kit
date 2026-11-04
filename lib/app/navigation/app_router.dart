import 'package:go_router/go_router.dart';

import 'package:starter_kit/features/home/presentation/home_page.dart';
import 'package:starter_kit/features/settings/presentation/settings_page.dart';

/// The application-level router configuration.
final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (context, state) => const SettingsPage(),
    ),
  ],
);
