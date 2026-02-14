import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/analysis_provider.dart';
import 'analysis_result_screen.dart';

class AnalysisResultContainer extends ConsumerWidget {
  const AnalysisResultContainer({super.key, required this.analysisId});
  final String analysisId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analysisAsync = ref.watch(analysisProvider(analysisId));

    return analysisAsync.when(
      data: (result) {
        if (result == null) return const Scaffold(body: Center(child: Text('Analysis not found')));
        // In a real app, we would fetch the session here to get the image URL.
        // For now, we use a placeholder or handle it in the next phase.
        return AnalysisResultScreen(
            result: result,
            imageUrl: 'https://via.placeholder.com/400x600.png?text=Skin+Analysis'
        );
      },
      error: (e, s) => Scaffold(body: Center(child: Text('Error: $e'))),
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}
