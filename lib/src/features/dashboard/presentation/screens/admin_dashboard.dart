import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              context.go('/profile');
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          DashboardButton(
            icon: Icons.map,
            label: 'Map',
            onPressed: () {
              context.go('/map');
            },
          ),
        ],
      ),
    );
  }
}

class DashboardButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const DashboardButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50),
            const SizedBox(height: 10),
            Text(label),
          ],
        ),
      ),
    );
  }
}
