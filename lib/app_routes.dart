import 'package:go_router/go_router.dart';
import 'package:weather_app/views/home/home_screen.dart';
import 'package:weather_app/views/search_page/search_screen.dart';
import 'package:weather_app/views/settings/settings_screen.dart';

final GoRouter goRoutes = GoRouter(
  initialLocation: '/home',
  routes: <RouteBase>[
    GoRoute(
      path: "/home",
      name: "/home",
      builder: (context, state) {
        return const WeatherScreeen();
      },
    ),
    GoRoute(
      path: "/search",
      name: "/search",
      builder: (context, state) {
        return const SearchScreen();
      },
    ),
    GoRoute(
      path: "/settings",
      name: "/settings",
      builder: (context, state) {
        return const SettingsScreen();
      },
    ),
  ],
);
