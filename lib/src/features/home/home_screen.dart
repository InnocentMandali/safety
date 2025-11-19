import 'package:emergen_sync/src/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.when(
          unknown: () {},
          authenticated: (user, role) {
            if (role == 'admin') {
              context.go('/admin_dashboard');
            } else {
              context.go('/user_dashboard');
            }
          },
          unauthenticated: () {
            context.go('/login');
          },
        );
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
