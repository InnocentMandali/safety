
import 'package:go_router/go_router.dart';
import 'package:emergen_sync/src/features/home/screens/welcome_screen.dart';
import 'package:emergen_sync/src/features/authentication/presentation/screens/login_screen.dart';
import 'package:emergen_sync/src/features/authentication/screens/signup_screen.dart';
import 'package:emergen_sync/src/features/home/home_screen.dart';
import 'package:emergen_sync/src/features/contacts/screens/contacts_screen.dart';
import 'package:emergen_sync/src/features/settings/screens/settings_screen.dart';
import 'package:emergen_sync/src/features/sos/screens/sos_location_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const WelcomeScreen(),
        routes: [
          GoRoute(
            path: 'welcome',
            builder: (context, state) => const WelcomeScreen(),
          ),
        ]
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
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/contacts',
        builder: (context, state) => const ContactsScreen(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
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
    ],
  );
}
