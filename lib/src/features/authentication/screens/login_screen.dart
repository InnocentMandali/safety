
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:emergen_sync/src/features/authentication/services/auth_service.dart';
import 'package:emergen_sync/src/shared/providers/user_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32.0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Welcome Back!',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock_outline),
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () async {
                          if (!_formKey.currentState!.validate()) return;

                          final userProvider = Provider.of<UserProvider>(context, listen: false);
                          final router = GoRouter.of(context);
                          final scaffoldMessenger = ScaffoldMessenger.of(context);

                          final user = await _authService.signIn(
                            _emailController.text,
                            _passwordController.text,
                          );

                          if (user != null) {
                            userProvider.setUser(user);
                            router.go('/home');
                          } else {
                            scaffoldMessenger.showSnackBar(
                              const SnackBar(content: Text('Failed to sign in')),
                            );
                          }
                        },
                        child: const Text('Login'),
                      ),
                      // const SizedBox(height: 16),
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     minimumSize: const Size(double.infinity, 50),
                      //     // backgroundColor: Theme.of(context).colorScheme.secondary,
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(8),
                      //     ),
                      //   ),
                      //   onPressed: () async {
                      //     final email = _emailController.text;
                      //     final scaffoldMessenger = ScaffoldMessenger.of(context);

                      //     if (email.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
                      //       scaffoldMessenger.showSnackBar(
                      //         const SnackBar(
                      //           content: Text('Please enter a valid email to receive a sign-in link.'),
                      //         ),
                      //       );
                      //       return;
                      //     }

                      //     await _authService.sendSignInLinkToEmail(email);

                      //     scaffoldMessenger.showSnackBar(
                      //       const SnackBar(
                      //         content: Text('Sign-in link sent to your email!'),
                      //       ),
                      //     );
                      //   },
                      //   child: const Text('Sign in with Email Link'),
                      // ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () => context.go('/signup'),
                        child: const Text('Don\'t have an account? Sign up'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
