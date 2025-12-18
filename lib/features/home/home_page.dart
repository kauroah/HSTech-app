import 'package:flutter/material.dart';
import 'package:subscription_app/core/storage/subscription_storage.dart';
import 'package:subscription_app/features/onboarding/onboarding_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = SubscriptionStorage();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await storage.clearAll();

              if (!context.mounted) return;

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (_) => const OnboardingPage()),
                (_) => false,
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10,
        itemBuilder: (_, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.star),
              title: Text('Item ${index + 1}'),
              subtitle: const Text('Any content here'),
            ),
          );
        },
      ),
    );
  }
}
