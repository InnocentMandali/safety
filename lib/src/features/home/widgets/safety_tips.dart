
import 'package:flutter/material.dart';

class SafetyTips extends StatelessWidget {
  const SafetyTips({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Safety Tips',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16.0),
            const Text('1. Be aware of your surroundings.'),
            const SizedBox(height: 8.0),
            const Text('2. Avoid walking alone at night.'),
            const SizedBox(height: 8.0),
            const Text('3. Share your location with trusted contacts.'),
            const SizedBox(height: 8.0),
            const Text('4. Keep your phone charged.'),
          ],
        ),
      ),
    );
  }
}
