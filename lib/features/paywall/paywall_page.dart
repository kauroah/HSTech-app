import 'package:flutter/material.dart';
import 'package:subscription_app/core/storage/subscription_storage.dart';
import 'package:subscription_app/features/home/home_page.dart';
import 'package:subscription_app/features/paywall/widgets/plan_card.dart';

enum Plan { month, year }

class PaywallPage extends StatefulWidget {
  const PaywallPage({super.key});

  @override
  State<PaywallPage> createState() => _PaywallPageState();
}

class _PaywallPageState extends State<PaywallPage> {
  final SubscriptionStorage _storage = SubscriptionStorage();

  Plan selectedPlan = Plan.year;
  bool isLoading = false;

  Future<void> _buy() async {
    setState(() => isLoading = true);

    await Future.delayed(const Duration(seconds: 1));
    await _storage.subscribe();

    if (!mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const HomePage()),
      (_) => false,
    );
  }

  Future<void> _startTrial() async {
    await _storage.startTrial();

    if (!mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const HomePage()),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paywall')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Choose your plan',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),

            PlanCard(
              title: 'Yearly',
              price: '\$29.99 / year',
              badgeText: 'Save 30%',
              isSelected: selectedPlan == Plan.year,
              onTap: () =>
                  setState(() => selectedPlan = Plan.year),
            ),

            PlanCard(
              title: 'Monthly',
              price: '\$3.99 / month',
              isSelected: selectedPlan == Plan.month,
              onTap: () =>
                  setState(() => selectedPlan = Plan.month),
            ),

            const Spacer(),

            ElevatedButton(
              onPressed: isLoading ? null : _buy,
              child: isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const Text('Continue'),
            ),

            TextButton(
              onPressed: _startTrial,
              child: const Text('Start Free Trial'),
            ),
          ],
        ),
      ),
    );
  }
}
