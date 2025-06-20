import 'package:catbreeds/models/cat_entity.dart';
import 'package:catbreeds/screens/details_screen.dart';
import 'package:catbreeds/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/main',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFD0D0D0),
                  Color(0xFFE0E0E0),
                  Color(0xFFFFFFFF),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: child,
          ),
        );
      },
      routes: [
        GoRoute(path: '/main', builder: (context, state) => MainScreen()),
        GoRoute(
          path: '/details',
          builder: (context, state) {
            final extra = state.extra as List<dynamic>;
            final cat = extra[0] as CatEntity;
            final heroTag = extra[1] as String;
            return DetailsScreen(cat: cat, heroTag: heroTag);
          },
        ),
      ],
    ),
  ],
);
