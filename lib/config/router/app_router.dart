import 'package:go_router/go_router.dart';
import 'package:tema_4/presentations/screens/team_screen.dart';

import '../../presentations/screens/home_screen.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(path: '/team', builder: (context, state) => const TeamScreen())
]);
