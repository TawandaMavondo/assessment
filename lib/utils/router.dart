import 'package:assessment/dto/company_dto.dart';
import 'package:assessment/home.dart';
import 'package:assessment/screens/edit_office.dart';
import 'package:assessment/screens/new_office.dart';
import 'package:assessment/screens/office.dart';
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
      path: '/office/view',
      builder: (context, state) => OfficeScreen(
        dto: state.extra as CompanyDTO,
      ),
    ),
    GoRoute(
      path: "/new/office",
      builder: (context, state) {
        return const NewOfficeScreen();
      },
    ),
    GoRoute(
      path: "/office/edit",
      builder: (context, state) {
        return EditOfficeScreen(
          dto: state.extra as CompanyDTO,
        );
      },
    ),
  ],
);
