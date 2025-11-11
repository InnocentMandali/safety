
import 'package:emergen_sync/src/features/emergency_contacts/screens/emergency_contacts_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:emergen_sync/src/features/authentication/screens/login_screen.dart';
import 'package:emergen_sync/src/features/authentication/screens/signup_screen.dart';
import 'package:emergen_sync/src/features/dashboard/screens/admin_dashboard_screen.dart';
import 'package:emergen_sync/src/features/home/screens/home_screen.dart';
import 'package:emergen_sync/main.dart';


final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const AuthWrapper();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginScreen();
          },
        ),
        GoRoute(
          path: 'signup',
          builder: (BuildContext context, GoRouterState state) {
            return const SignupScreen();
          },
        ),
        GoRoute(
          path: 'admin',
          builder: (BuildContext context, GoRouterState state) {
            return const AdminDashboardScreen();
          },
        ),
         GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          },
        ),
        GoRoute(
          path: 'emergency_contacts',
          builder: (BuildContext context, GoRouterState state) {
            return const EmergencyContactsScreen();
          },
        ),
      ],
    ),
  ],
  redirect: (BuildContext context, GoRouterState state) {
    final user = Provider.of<User?>(context, listen: false);
    final loggingIn = state.matchedLocation == '/login' || state.matchedLocation == '/signup';

    if (user == null) {
      return loggingIn ? null : '/login';
    }

    if (loggingIn) {
      return '/home';
    }

    return null;
  },
);
