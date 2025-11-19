import 'package:emergen_sync/src/features/authentication/data/auth_repository.dart';
import 'package:emergen_sync/src/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: BlocListener<AuthBloc, AuthState>(
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
            unauthenticated: () {},
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthRepository>().signInWithEmailAndPassword(
                        _emailController.text,
                        _passwordController.text,
                      );
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
