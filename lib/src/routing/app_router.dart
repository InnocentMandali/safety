
import 'package:go_router/go_router.dart';
import 'package:emergen_sync/src/features/home/screens/home_screen.dart';
import 'package:emergen_sync/src/features/home/screens/welcome_screen.dart';
import 'package:emergen_sync/src/features/emergency_contacts/screens/emergency_contacts_screen.dart';
import 'package:emergen_sync/src/features/sos/screens/sos_screen.dart';
import 'package:emergen_sync/src/features/authentication/presentation/screens/login_screen.dart';
import 'package:emergen_sync/src/features/authentication/presentation/screens/signup_screen.dart';

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
    GoRoute(
      path: '/sos',
      builder: (context, state) => const SOSTriggerScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignUpScreen(),
    ),
  ],
);
