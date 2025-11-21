
import 'package:emergen_sync/src/core/routing/scaffold_with_nav_bar.dart';
import 'package:emergen_sync/src/features/emergency_contacts/screens/emergency_contacts_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:emergen_sync/src/features/home/screens/welcome_screen.dart';
import 'package:emergen_sync/src/features/authentication/presentation/screens/login_screen.dart';
import 'package:emergen_sync/src/features/authentication/screens/signup_screen.dart';
import 'package:emergen_sync/src/features/home/screens/home_screen.dart';
import 'package:emergen_sync/src/features/contacts/screens/contacts_screen.dart';
import 'package:emergen_sync/src/features/settings/screens/settings_screen.dart';
import 'package:emergen_sync/src/features/sos/screens/sos_location_screen.dart';
import 'package:emergen_sync/src/features/tasks/screens/tasks_screen.dart';

class AppRouter {
  // private navigator key
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    routes: [
      // Routes that should NOT have the bottom navigation bar
      GoRoute(
        path: '/',
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignupScreen(),
      ),
       GoRoute(
        path: '/sos_location/:latitude/:longitude',
        builder: (context, state) {
          final latitude = double.parse(state.pathParameters['latitude']!);
          final longitude = double.parse(state.pathParameters['longitude']!);
          return SosLocationScreen(
            latitude: latitude,
            longitude: longitude,
          );
        },
      ),

      // Main application shell with bottom navigation bar
      ShellRoute(
        builder: (context, state, child) {
          return ScaffoldWithNavBar(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/contacts',
            builder: (context, state) => const ContactsScreen(),
            routes: [
              // Sub-route for emergency contacts
              GoRoute(
                path: 'emergency_contacts',
                builder: (context, state) => const EmergencyContactsScreen(),
              ),
            ],
          ),
          GoRoute(
            path: '/tasks',
            builder: (context, state) => const TasksScreen(),
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => const SettingsScreen(),
          ),
        ],
      ),
    ],
  );
}
