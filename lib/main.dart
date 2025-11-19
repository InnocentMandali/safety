
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:emergen_sync/src/core/theme/theme.dart';
import 'package:emergen_sync/src/shared/providers/theme_provider.dart';
import 'package:emergen_sync/src/shared/providers/user_provider.dart';
import 'package:emergen_sync/src/features/authentication/services/auth_service.dart';
import 'package:emergen_sync/src/features/contacts/providers/emergency_contact_provider.dart';
import 'package:emergen_sync/src/features/notifications/providers/notification_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:emergen_sync/src/features/home/widgets/home_content.dart';
import 'package:emergen_sync/src/features/home/screens/map_screen.dart';
import 'firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => EmergencyContactProvider()),
        ChangeNotifierProvider(create: (context) => NotificationProvider(navigatorKey: navigatorKey)..initialize()),
        StreamProvider<User?>.value(
          value: AuthService().user,
          initialData: null,
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  late final GoRouter _router = GoRouter(
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeContent(),
        routes: [
          GoRoute(
            path: 'map',
            builder: (context, state) {
              final lat = double.parse(state.uri.queryParameters['lat']!);
              final long = double.parse(state.uri.queryParameters['long']!);
              return MapScreen(latitude: lat, longitude: long);
            },
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp.router(
          title: 'EmergenSync',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeProvider.themeMode,
          routerConfig: _router,
        );
      },
    );
  }
}
