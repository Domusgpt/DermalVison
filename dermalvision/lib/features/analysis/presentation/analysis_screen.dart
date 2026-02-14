import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Analysis')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Analysis Module Placeholder'),
            const SizedBox(height: 12),
            OutlinedButton(
              key: const Key('back_home_from_analysis_button'),
              onPressed: () => context.go('/home'),
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
