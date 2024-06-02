import 'package:assessment/home.dart';
import 'package:assessment/screens/new_office.dart';
import 'package:assessment/screens/office.dart';
import 'package:assessment/widgets/edit_user_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/office/:id',
      builder: (context, state) => OfficeScreen(
        id: state.pathParameters['id']!,
      ),
    ),
    GoRoute(
      path: "/new/office",
      builder: (context, state) {
        return const NewOfficeScreen();
      },
    ),
  ],
);
