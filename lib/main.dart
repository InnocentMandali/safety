
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:emergen_sync/src/core/router/router.dart';
import 'package:emergen_sync/src/core/theme/theme.dart';
import 'package:emergen_sync/src/shared/providers/theme_provider.dart';
import 'package:emergen_sync/src/shared/providers/user_provider.dart';
import 'package:emergen_sync/src/features/authentication/services/auth_service.dart';
import 'package:emergen_sync/src/features/home/screens/home_screen.dart';
import 'package:emergen_sync/src/features/authentication/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

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
        StreamProvider<User?>.value(
          value: AuthService().user,
          initialData: null,
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp.router(
          title: 'EmergenSync',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeProvider.themeMode,
          routerConfig: router,
        );
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    if (user == null) {
      return const LoginScreen();
    } else {
      return const HomeScreen();
    }
  }
}

