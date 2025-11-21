
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _safetyTips = [
    {
      "title": "Stay Alert and Aware",
      "description": "Be aware of your surroundings, especially in new or crowded places. Avoid distractions like using your phone or listening to music with both headphones.",
      "image": "https://picsum.photos/seed/picsum/400/300"
    },
    {
      "title": "Share Your Location",
      "description": "Let a trusted friend or family member know your plans and share your live location with them when you're out alone.",
      "image": "https://picsum.photos/seed/picsum/400/300"
    },
    {
      "title": "Trust Your Instincts",
      "description": "If a situation or person makes you feel uncomfortable, leave immediately. Your intuition is a powerful safety tool.",
      "image": "https://picsum.photos/seed/picsum/400/300"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _safetyTips.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return SafetyTipPage(
                    title: _safetyTips[index]['title']!,
                    description: _safetyTips[index]['description']!,
                    image: _safetyTips[index]['image']!,
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _safetyTips.length,
                (index) => buildDot(index, context),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => context.go('/login'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text('Login'),
                    ),
                    const SizedBox(height: 16),
                    OutlinedButton(
                      onPressed: () => context.go('/signup'),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: _currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: _currentPage == index ? Theme.of(context).primaryColor : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class SafetyTipPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const SafetyTipPage({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            image,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
