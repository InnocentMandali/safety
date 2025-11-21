
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'core/routing/app_router.dart';
import 'features/authentication/presentation/bloc/auth_bloc.dart';
import 'features/authentication/presentation/bloc/auth_state.dart';
import 'features/theme/theme_provider.dart';

class EmergenSyncApp extends StatelessWidget {
  const EmergenSyncApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        // You can add global listeners here if needed, e.g., for navigation
        // based on auth state changes.
      },
      child: MaterialApp.router(
        title: 'EmergenSync',
        theme: themeProvider.lightTheme,
        darkTheme: themeProvider.darkTheme,
        themeMode: themeProvider.themeMode,
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
