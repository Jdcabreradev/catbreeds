import 'package:catbreeds/screens/main_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/main',
  routes: [
    GoRoute(path: '/main', builder: (context, state) => const MainScreen()),
  ],
);
