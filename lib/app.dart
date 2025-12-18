import 'package:flutter/material.dart';
import 'package:subscription_app/core/storage/subscription_storage.dart';
import 'package:subscription_app/features/home/home_page.dart';
import 'package:subscription_app/features/onboarding/onboarding_page.dart';

class AppBootstrap extends StatefulWidget {
  const AppBootstrap({super.key});

  @override
  State<AppBootstrap> createState() => _AppBootstrapState();
}

class _AppBootstrapState extends State<AppBootstrap> {
  final storage = SubscriptionStorage();
  bool? hasAccess;

  @override
  void initState() {
    super.initState();
    _checkAccess();
  }

  Future<void> _checkAccess() async {
    final result = await storage.hasAccess();
    if (!mounted) return;
    setState(() => hasAccess = result);
  }

  @override
  Widget build(BuildContext context) {
    if (hasAccess == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return hasAccess!
        ? const HomePage()
        : const OnboardingPage();
  }
}
