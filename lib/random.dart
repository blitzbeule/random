import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/coin.dart';
import 'screens/groups.dart';

class RandomApp extends StatelessWidget {
  RandomApp({super.key});

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: "/groups",
        name: "groups",
        builder: (context, state) => const GroupScreen(),
      ),
      GoRoute(
        path: "/coin",
        name: "coin",
        builder: (context, state) => const CoinScreen(),
      ),
    ],
    initialLocation: "/coin",
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
