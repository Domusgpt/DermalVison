import 'package:dermalvision/features/auth/application/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('DermalVision Login')),
      body: Center(
        child: FilledButton(
          key: const Key('login_button'),
          onPressed: () =>
              ref.read(authControllerProvider.notifier).signInAnonymously(),
          child: const Text('Continue'),
        ),
      ),
    );
  }
}
