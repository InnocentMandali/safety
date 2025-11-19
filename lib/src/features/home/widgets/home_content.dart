import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:emergen_sync/src/features/home/widgets/safety_tips.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EmergenSync'),
        actions: [
          TextButton(
            onPressed: () => context.go('/login'),
            child: const Text('Login', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => context.go('/signup'),
            child: const Text('Signup', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withAlpha(128),
                    spreadRadius: 10,
                    blurRadius: 20,
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'SOS',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          const SafetyTips(),
        ],
      ),
    );
  }
}
