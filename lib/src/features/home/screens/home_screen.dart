
import 'package:emergen_sync/src/features/authentication/data/auth_repository.dart';
import 'package:emergen_sync/src/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:emergen_sync/src/features/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('EmergenSync Dashboard'),
        actions: [
          IconButton(
            icon: Icon(themeProvider.themeMode == ThemeMode.dark
                ? Icons.light_mode
                : Icons.dark_mode),
            onPressed: () => themeProvider.toggleTheme(),
            tooltip: 'Toggle Theme',
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthRepository>().signOut();
            },
            tooltip: 'Logout',
          ),
        ],
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return state.when(
            unknown: () => const Center(child: CircularProgressIndicator()),
            authenticated: (user, role) {
              return ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  Text(
                    'Welcome!',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'What would you like to do today?',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 24),
                  _buildFeatureCard(
                    context,
                    icon: Icons.sos,
                    title: 'SOS',
                    subtitle: 'Send an emergency alert',
                    onTap: () => context.go('/sos'),
                  ),
                  const SizedBox(height: 16),
                  _buildFeatureCard(
                    context,
                    icon: Icons.contact_emergency_outlined,
                    title: 'Emergency Contacts',
                    subtitle: 'Manage your trusted contacts',
                    onTap: () => context.go('/emergency-contacts'),
                  ),
                  const SizedBox(height: 16),
                  _buildFeatureCard(
                    context,
                    icon: Icons.task_alt_outlined,
                    title: 'Tasks & Drills',
                    subtitle: 'Complete safety tasks and drills',
                    onTap: () => context.go('/tasks'),
                  ),
                  if (role == 'admin') ...[
                    const SizedBox(height: 16),
                    _buildFeatureCard(
                      context,
                      icon: Icons.admin_panel_settings_outlined,
                      title: 'Admin Dashboard',
                      subtitle: 'Access administrative features',
                      onTap: () => context.go('/admin_dashboard'),
                    ),
                  ],
                ],
              );
            },
            unauthenticated: () {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.go('/');
              });
              return const Center(
                child: Text('Not authenticated. Please login.'),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => Center(child: Text(message)),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/sos'),
        backgroundColor: Colors.red,
        child: const Icon(Icons.sos, color: Colors.white),
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Icon(icon, size: 40, color: Theme.of(context).primaryColor),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.grey.shade400),
            ],
          ),
        ),
      ),
    );
  }
}
