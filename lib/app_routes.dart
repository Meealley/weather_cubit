import 'package:go_router/go_router.dart';
import 'package:weather_app/views/home/home_screen.dart';

final GoRouter goRoutes = GoRouter(
  initialLocation: '/home',
  routes: <RouteBase>[
    GoRoute(
      path: "/home",
      name: "/home",
      builder: (context, state) {
        return const WeatherScreeen();
      },
    )
  ],
);
