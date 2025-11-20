
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:emergen_sync/src/features/home/screens/home_screen.dart';
import 'package:emergen_sync/src/features/home/screens/welcome_screen.dart';
import 'package:emergen_sync/src/features/emergency_contacts/screens/emergency_contacts_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/emergency-contacts',
      builder: (context, state) => const EmergencyContactsScreen(),
    ),
  ],
);
