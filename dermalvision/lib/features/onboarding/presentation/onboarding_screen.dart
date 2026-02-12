import 'package:dermalvision/features/auth/application/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Onboarding')),
      body: Center(
        child: FilledButton(
          key: const Key('finish_onboarding_button'),
          onPressed: () =>
              ref.read(authControllerProvider.notifier).completeOnboarding(),
          child: const Text('Finish setup'),
        ),
      ),
    );
  }
}
