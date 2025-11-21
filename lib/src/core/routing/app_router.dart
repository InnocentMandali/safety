
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/authentication/presentation/screens/login_screen.dart';
import '../../features/authentication/presentation/screens/signup_screen.dart';
import '../../features/emergency_contacts/screens/add_emergency_contact_screen.dart';
import '../../features/emergency_contacts/screens/emergency_contacts_screen.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/sos/screens/sos_screen.dart';
import '../../features/tasks/screens/tasks_screen.dart';
import '../presentation/widgets/scaffold_with_nav_bar.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginScreen(),
        routes: [
          GoRoute(
            path: 'signup',
            builder: (context, state) => const SignupScreen(),
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: [
          // Home branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),

          // SOS branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/sos',
                builder: (context, state) => const SOSTriggerScreen(),
              ),
            ],
          ),

          // Emergency Contacts branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/emergency-contacts',
                builder: (context, state) => const EmergencyContactsScreen(),
                routes: [
                  GoRoute(
                    path: 'add',
                    builder: (context, state) =>
                        const AddEmergencyContactScreen(),
                  ),
                ],
              ),
            ],
          ),

          // Tasks branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/tasks',
                builder: (context, state) => const TasksScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
