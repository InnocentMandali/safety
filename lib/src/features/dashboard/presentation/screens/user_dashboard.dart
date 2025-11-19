import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserDashboard extends StatelessWidget {
  const UserDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              context.go('/profile');
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Welcome, User!'),
      ),
    );
  }
}
